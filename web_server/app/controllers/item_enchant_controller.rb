class ItemEnchantController < ApplicationController
  before_action :auth_check

  def enchant
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no] + " ITEM_NO:" + params[:ITEM_NO], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end

    @item_instance = ItemInstance.where(:ITEM_NO => params[:ITEM_NO]).first
    if @item_instance == nil
      return error("not find item_instance. ITEM_NO:" + params[:ITEM_NO], 100030)
    end

    @item_info = ItemInfo.where(:ITEM_ID => params[:ITEM_ID]).first
    if @item_info == nil
      return error("not find item_info. item_id:" + params[:ITEM_ID], 100031)
    end

    if @item_info.IS_ENCHANT == "false"
        return error("not enchant item. " + params[:user_no] + " item_instance:" + item_instance.to_s, 100065)
    end

    #@item_enchant = ItemEnchant.where(:GRADE => @item_instance.GRADE, :ENCHANT => @item_instance.ENCHANT).first 
    @item_enchant = ItemEnchant.where(:ITEM_ENCHANT_ID => params[:enchant_id].to_i).first
    
    if @item_enchant == nil
      return error("not find item_enchant. item_enchant_id : " + params[:enchant_id].to_i.to_s, 100032)
    end

    if @user.MONEY < @item_enchant.MONEY
      return message("not enough user MONEY: " + params[:user_no] + " money:" + @user.MONEY.to_s + "<" + @item_enchant.MONEY.to_s, 100033)      
    end

    @item_instance.SLOT_TYPE = params[:SLOT_TYPE]
    
    if( params[:SLOT_TYPE] == "EQUIP" )
      @item_instance.CHARACTER_NO = @character.CHARACTER_NO
    end
    
    enchant_probability = @item_enchant.ENCHANT_PROBABILITY.split("|")
    
    total_value_for_percent = 0.0
    
    for n in 0...enchant_probability.length
      total_value_for_percent += enchant_probability[n].to_f
    end
        
    arr = Array.new
    for n in 0..enchant_probability.length - 1
      arr.append(n)
    end
    
    arr.reverse!
    
    enchant_value = 0
    for n in arr
      if rand(0..total_value_for_percent) <= enchant_probability[n].to_f
        enchant_value = n
        break
      end
    end
    
    @user.MONEY -= @item_enchant.MONEY

    original_enchant = @item_instance.ENCHANT  
    @item_instance.ENCHANT += enchant_value.to_i
    @item_instance.ENCHANT = [@item_instance.ENCHANT.to_i, 5].min
    
    for n in original_enchant...@item_instance.ENCHANT
      @item_enchant_effect = ItemEnchantEffect.where(:GRADE => @item_instance.GRADE, :ENCHANT => n+1, :ITEM_CATEGORY => @item_info.CATEGORY, :LEVEL => @item_info.LEVEL).first
      if @item_enchant_effect != nil
        new_option = String.new
        option_list = @item_instance.DEFAULT_OPTION.split("|")
        option_list.each do |option|
          grade, detail_id, val = option.split("_")
          
          effects = @item_enchant_effect.BASIC_EFFECT.split("|")
          value = apply_effect(effects, val)
  
          if new_option != ""
            new_option = new_option + "|"
          end
          
          new_option = new_option + grade + "_"  + detail_id + "_" + value.to_s
        end
        
        @item_instance.DEFAULT_OPTION = new_option
        
        bonus_option = item_option_composite(@item_enchant_effect.BONUS_EFFECT, "")
        if bonus_option.size != 0
          @item_instance.OPTION_LIST = @item_instance.OPTION_LIST + "|" + bonus_option
        end 
      end
      @item_instance.save
    end
    
    @user.save
    
    log_to_db("ITEM_ENCHANT", @item_instance.as_json.merge("ENCHANT_VALUE" => enchant_value).to_json, @user, @character)

    respond_to do |format|
      format.html 
      format.json { render json: @item_instance }
    end
  end
end
