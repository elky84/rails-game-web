require 'rest-client'
require 'socket'

class ShopController < ApplicationController
  before_action :auth_check, only: [:buy]
  
  def buy_cash()
    products = params[:product_id]
    store = params[:store]
    
    if store == "GOOGLE"          
      package_name = "com.nextmv.sunbee.googlekr"
      @purchase_code = params[:purchase_token]
      begin
        res = RestClient.post "https://accounts.google.com/o/oauth2/token", :client_id => "418303049316-tlpa4puqcd5qsnodmpo405bu2tuh1f2r.apps.googleusercontent.com", :client_secret => "wbBnyTLFjg8VErcmqKyu3MMS", :refresh_token => "1/Hkj4RGqibru8jNNltTnmXOwE35I4lbMg3IDZpzWIUAA", :grant_type => "refresh_token"
        res_json = JSON.parse(res.to_s)
        access_token = res_json['access_token']
      rescue => e
        logger.info e.to_s
        return error("refresh token failed. ", 100200)
      end
      
      begin
        addr = "https://www.googleapis.com/androidpublisher/v2/applications/" + package_name.to_s + "/purchases/products/" + products.to_s + "/tokens/" + @purchase_code
        #debug_logger(addr.to_s + " res " + res_json.to_s)
        res = RestClient.get addr, {:params => { :access_token => access_token}}
        res_json = JSON.parse(res.to_s)
        purchase_state = res_json['purchaseState']
      rescue => e
        logger.info e.to_s
        return error("failed get purchase status ", 100201)
      end
      
      if purchase_state != 0
        return error("invalid purchase_state. " + purchase_state.to_s, 100201)
      end
          
      begin
        addr = "https://www.googleapis.com/androidpublisher/v2/applications/" + package_name.to_s + "/inappproducts/" + products.to_s
        #debug_logger(addr.to_s + " res " + res_json.to_s)
        res = RestClient.get addr, {:params => { :access_token => access_token}}
      rescue => e
        logger.info e.to_s
        return error("not find sku detail. ", 100201)
      end
      
      logger.info res.to_s
      
      LogInstance.where(:USER_NO => @user.USER_NO, :LOG_TYPE => "CHARGE_DIAMOND").each do |instance|
        h = JSON.parse(instance.VALUE)      
        if @purchase_code == h["PURCHASE_CODE"]
          return error("already use purchase code", 100202)
        end      
      end
    elsif store == "N_STORE" 
      @purchase_code = params[:payment_seq]
      ip=Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
      ip = ip.ip_address
      
      begin
        addr = "http://" + ip + ":8888/receipt_url?payment_seq=" + @purchase_code
        logger.info addr.to_s
        req_url = RestClient.get addr
      rescue => e
        logger.info e.to_s
        return error("get naver url failed. ", 100200)
      end
      
      begin
        #debug_logger(addr.to_s + " res " + res_json.to_s)
        logger.info req_url
        res = RestClient.get req_url
        res_json = JSON.parse(res.to_s)
        code = res_json['code']
      rescue => e
        logger.info e.to_s
        return error("failed get purchase status ", 100201)
      end
      
      if code != 0
        return error("invalid purchase_state. " + code.to_s, 100201)
      end


      LogInstance.where(:USER_NO => @user.USER_NO, :LOG_TYPE => "CHARGE_DIAMOND").each do |instance|
        h = JSON.parse(instance.VALUE)      
        if @purchase_code == h["PURCHASE_CODE"]
          return error("already use purchase code", 100202)
        end      
      end
    else
      return error("invalid store type." + store)
    end      
        
    @shop_item_json = @shop_item.as_json.merge("PURCHASE_CODE" => @purchase_code).to_json
    
    log_to_db("CHARGE_DIAMOND", @shop_item_json, @user, @character)
    return true
  end
  
  def buy
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. " + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not find character." + params[:character_no], 100019)
    end
     
    @shop_item = ShopItem.where(:SHOP_ITEM_ID => params[:shop_item_id]).first
    if @shop_item == nil
      return error("not shop_item " + params[:user_no], 100042)
    end

    #now_time = Time.now
    #if now_time < @shop_item.START_DATE || @shop_item.END_DATE < now_time
    #  return error("not sale period. " + params[:user_no], 100043)
    #end
       
    result = Hash.new

    #---------------------------------------------------------------------
    # 보유량 최대치 검사
    
    is_able = true
    
    if @shop_item.SHOP_CATEGORY == "GACHA"
      check = check_more_than_max_value(@user)
      if check == false
        if @user.CACHE_MONSTER_SLOT >= @user.EXT_MONSTER_SLOT
          return error("more than max value in inven monster", 100078)
        elsif @user.CACHE_ITEM_SLOT >= @user.EXT_ITEM_SLOT
          return error("more than max value in inven item", 100079)
        end
      end
      
      @gacha = Gacha.where(:GACHA_ID => @shop_item.GACHA).first
          
      group_ids = @gacha.GROUP_ID.split("|")
      probability = @gacha.REWARD_PROBABILITY.split("|")
  
      gacha_group_id = group_ids[0]
     
      if gacha_group_id == nil
        return error("rand : " + random_for_gacha + ", not set gacha group index.", 100008)
      end
      
      @gacha_group = GachaGroup.where(:GACHA_GROUP_ID => gacha_group_id).first 
      if @gacha_group == nil
        return error("not found group id : " + gacha_group_id.to_s, 100009)
      end
      
      group_rewards = @gacha_group.GROUP_REWARD.split("|")[0].split("_")[0]
        
      debug_logger(group_rewards)
      
      # 구분 검사
      if group_rewards == "M"
        if @user.CACHE_MONSTER_SLOT >= @user.EXT_MONSTER_SLOT
          is_able = false
        end
      elsif group_rewards == "I" 
        if @user.CACHE_ITEM_SLOT >= @user.EXT_ITEM_SLOT
          is_able = false
        end
      end
        
      add_result(result, "CHECK", is_able)
    end
    
    @shop_item_json = @shop_item.as_json.to_json
    #---------------------------------------------------------------------
    if is_able == true   

      if @shop_item.PRICE_TYPE == "CASH"
        if false == buy_cash()
          return false
        end
      elsif @shop_item.PRICE_TYPE == "GOLD"
        if @user.MONEY >= @shop_item.PRICE
          @user.MONEY -= @shop_item.PRICE
        else
          return message("not enough Money", 100045)
        end
      elsif @shop_item.PRICE_TYPE == "DIAMOND"
        if @user.CASH >= @shop_item.PRICE
          @user.CASH -= @shop_item.PRICE
        else
          return message("not enough diamond", 100046)
        end 
      elsif @shop_item.PRICE_TYPE == "FRIEND_POINT"
        if @user.FRIEND_POINT >= @shop_item.PRICE
          @user.FRIEND_POINT -= @shop_item.PRICE
        else
          return message("not enough friend_point", 100047)
        end 
      else
        return error("inapposite CASH_TYPE " + params[:user_no], 120007) 
      end
        
      if add_item(result, @user, @shop_item.SHOP_CATEGORY, @shop_item.CAPACITY, shop_item_argument(@character, @shop_item)) == false
        return
      end
  
      str_bonus_id = @shop_item.BONUS_ID.split("|")
      str_bonus_id.each do |bonus_shop_id|
        if bonus_shop_id == "0"
          next
        end
        
        @shop_bonus_item = ShopItem.where(:SHOP_ITEM_ID => bonus_shop_id).first
        if @shop_bonus_item == nil
          return error("not shop_item " + params[:user_no] + " bonus: " + bonus_shop_id.to_s, 100044)
        end
        
        if add_item(result, @user, @shop_bonus_item.SHOP_CATEGORY, @shop_bonus_item.CAPACITY, shop_item_argument(@character, @shop_bonus_item)) == false
          return
        end
      end
     
      @user.save
    end

    if @shop_item.SHOP_CATEGORY == "GACHA" && @shop_item.PRICE_TYPE == "DIAMOND"
      log_to_db("CASH_GACHA", @shop_item_json, @user, @character)
    end

    log_to_db("SHOP_BUY", @shop_item_json, @user, @character)      
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end
  
  def shop_item_argument(character, shop_item)
    argument = nil
    if shop_item.SHOP_CATEGORY == "GACHA"
      argument = shop_item.GACHA
    elsif shop_item.SHOP_CATEGORY == "EXP"
      argument = character
    else
      argument = shop_item.ITEM_ID
    end
    return argument
  end
  
  def get_key
    # store 초기화시 필요한 복호화용 키 
    result = Hash.new
    result["RESULT_TYPE"] = "KEY"
    result["RESULT_VALUE"] = "sunbeesunbeeKimsunbeelv999sunbee"
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end
  
end
