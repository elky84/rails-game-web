class ItemReoptionController < ApplicationController
  before_action :auth_check

  def reoption
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
      return error("not find item_instance. ITEM_NO:" + params[:user_no], 100030)
    end

    @item_info = ItemInfo.where(:ITEM_ID => params[:ITEM_ID]).first
    if @item_info == nil
      return error("not find item_info. item_id:" + params[:user_no], 100031)
    end

    if @item_info.IS_REOPTION == false
        return message("not reoption item. " + params[:user_no] + " item_instance:" + @item_instance.to_s, 100063)
    end

    @item_reoption = ItemReoption.where(:ITEM_CATEGORY => @item_info.CATEGORY, :GRADE => params[:GRADE] , :LEVEL => params[:LEVEL]).first
    if @item_reoption == nil
      return error("not find item_reoption. grade" + params[:user_no], 100032)
    end

    price = @item_reoption.MONEY.split("_")
    amount = price[1].to_i
    if price[0] == "G"
      if @user.MONEY < amount
        return message("not enough user MONEY. user_no : " + params[:user_no] + " money : " + @user.MONEY.to_s + " amount : " + amount.to_s, 100033)      
     end
      @user.MONEY -= amount
    elsif price[0] == "D"
      if @user.CASH < amount
        return message("not enough user CASH. user_no : " + params[:user_no] + " money : " + @user.CASH.to_s + " amount : " + amount.to_s, 100046)      
      end
      @user.CASH -= amount
    end

    @item_instance.SLOT_TYPE = params[:SLOT_TYPE]
    
    @item_enchant_effect = ItemEnchantEffect.where(:ITEM_CATEGORY => @item_info.CATEGORY, :LEVEL => @item_info.LEVEL, :GRADE => @item_instance.GRADE, :ENCHANT => @item_instance.ENCHANT).first
    if @item_enchant_effect != nil
      @item_instance.OPTION_LIST = item_option_composite(@item_info.ITEM_OPTION_LIST, "")    
      bonus_option = item_option_composite(@item_enchant_effect.BONUS_EFFECT, "")
      if bonus_option.size != 0
        @item_instance.OPTION_LIST = @item_instance.OPTION_LIST + "|" + bonus_option
      end 
    else
      @item_instance.OPTION_LIST = item_option_composite(@item_info.ITEM_OPTION_LIST, "")
    end

    
    @item_instance.save
    @user.save

    log_to_db("ITEM_REOPTION", @item_instance.to_json, @user, @character)

    respond_to do |format|
      format.html 
      format.json { render json: @item_instance }
    end
  end
end
