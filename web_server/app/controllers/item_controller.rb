class ItemController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname, :equip_find_by_nickname]
  before_action :ip_check, only: [:find_by_nickname]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @item_instances = get_items(user_no)
    
    respond_to do |format|
      format.html 
      format.json { render json: @item_instances }
    end
  end

  def equip_find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    
    @character = CharacterInstance.where(:USER_NO => user_no, :CHARACTER_ID => params[:character_id]).first
    if @character == nil
      return error("not find character" + params[:character_id], 100019)
    end
    
    @item_instances = ItemInstance.where(:USER_NO => user_no, :CHARACTER_NO => @character.CHARACTER_NO)
    
    respond_to do |format|
      format.html 
      format.json { render json: @item_instances }
    end
  end

  def get_items(user_no)
    @item_instances = ItemInstance.where("#{column_name("USER_NO")} = #{user_no} AND #{column_name("END_DATE")} >= '#{Time.now.utc}'")
    return @item_instances
  end

  def all
    @item_instances = get_items(params[:user_no])
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not exist user_id " + params[:user_no], 100000)
    end

    hide_count = @item_instances.where("#{column_name("SLOT_TYPE")} != 'HIDE'").count

    @user.CACHE_ITEM_SLOT = @item_instances.count - hide_count 
    @user.save
      
    result = Hash.new

    add_result(result, "USER", @user)

    @item_instances.each  do |item|
      add_result(result, "ITEM", item)
    end
      
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end

  def inventory
    @item_instances = ItemInstance.where(:USER_NO => params[:user_no], :SLOT_TYPE => "INVENTORY")
    respond_to do |format|
      format.html 
      format.json { render json: @item_instances }
    end
  end

  def equip
    @item_instances = ItemInstance.where(:USER_NO => params[:user_no], :SLOT_TYPE => "EQUIP")
    respond_to do |format|
      format.html 
      format.json { render json: @item_instances }
    end
  end

  def postbox
    @item_instances = ItemInstance.where(:USER_NO => params[:user_no], :SLOT_TYPE => "POSTBOX")
    respond_to do |format|
      format.html 
      format.json { render json: @item_instances }
    end
  end

  def buff
    @item_instances = ItemInstance.where(:USER_NO => params[:user_no], :SLOT_TYPE => "BUFF")
    respond_to do |format|
      format.html 
      format.json { render json: @item_instances }
    end
  end
  
  def sell
    @user = UserInstance.where(:USER_NO => params[:USER_NO]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:USER_NO] + " ITEM_NO:" + params[:ITEM_NO], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end

    @item_instance = ItemInstance.where(:ITEM_NO => params[:ITEM_NO]).first
    if @item_instance == nil
      return error("not find item_instance. USER_NO:" + params[:USER_NO] + " ITEM_NO:" + params[:ITEM_NO], 100030)
    end

    @item_info = ItemInfo.where(:ITEM_ID => params[:ITEM_ID]).first
    if @item_info == nil
      return error("not find item_info. USER_NO:" + params[:USER_NO] + " ITEM_NO:" + params[:ITEM_NO], 100031)
    end
    
    if @item_info.IS_SELL == false
      return message("not sell item. " + params[:USER_NO] + " item_instance:" + @item_instance.to_s, 100064)
    end
    
    result = Hash.new      
    
    add_item(result, @user, "GOLD", @item_info.PRICE , nil)
    @user.CACHE_ITEM_SLOT -= 1
    @user.save
    
    @item_instance.destroy
  
    hash = Hash.new
    hash["RESULT_TYPE"] = "SELL_ITEM"
    hash["RESULT_VALUE"] = @item_instance
    result[result.length] = hash
      
    log_to_db("ITEM_SELL", @item_instance.to_json, @user, @character)
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
    
  end
  
  def select_sell
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
  
    result = Hash.new      
    count = params[:COUNT]
      
    for n in 0..count.to_i-1
      at = "PARAMS_" + n.to_s
      item_instance = params[at]
      
      @item_instance = ItemInstance.where(:ITEM_NO => item_instance[:ITEM_NO]).first
      if @item_instance == nil
        return error("not find item_instance. USER_NO:" + params[:USER_NO] + " ITEM_NO:" + item_instance[:ITEM_NO], 100030)
      end
  
      @item_info = ItemInfo.where(:ITEM_ID => item_instance[:ITEM_ID]).first
      if @item_info == nil
        return error("not find item_info. USER_NO:" + params[:USER_NO] + " ITEM_NO:" + item_instance[:ITEM_ID], 100031)
      end
      
      if @item_info.IS_SELL == false
        return message("not sell item. " + params[:USER_NO] + " item_instance:" + @item_instance.to_s, 100064)
      end

      add_item(result, @user, "GOLD", @item_info.PRICE , nil)
      @user.CACHE_ITEM_SLOT -= 1

      
      @item_instance.destroy
    
      hash = Hash.new
      hash["RESULT_TYPE"] = "SELL_ITEM"
      hash["RESULT_VALUE"] = @item_instance
      result[result.length] = hash
    end
    
    log_to_db("ITEM_SELCET_SELL", @item_instance.to_json, @user, @character)
    @user.save
            
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
    
  end
end
