require 'rest-client'
require 'socket'

class CouponController < ApplicationController
  before_action :auth_check, only: [:use]
  before_action :ip_check, only: [:issue, :issue_list, :find_by_code, :show, :find_by_nickname]

  def use_relay
    @coupon_instance = use_real(params[:user_no], params[:coupon_string], params[:server_index])
    if @coupon_instance == nil
      return 
    end

    respond_to do |format|
      format.html 
      format.json { render json: @coupon_instance }
    end
  end
  
  def use_real(user_no, coupon_string, server_index)
    @coupon_instance = CouponInstance.where(:COUPON_STRING => coupon_string).first
    if @coupon_instance == nil
      message("not find coupon_string. USER_NO:" + user_no + " coupon_string:" + coupon_string, 100061)
    return nil
    end
     
    #이미 사용된 쿠폰
    if @coupon_instance.USER_NO != nil
      message("already used coupon. USER_NO:" + user_no + " coupon_string:" + coupon_string, 100060)
    return nil
    end
    
    if nil != CouponInstance.where(:USER_NO => params[:user_no], :COUPON_GROUP => @coupon_instance.COUPON_GROUP, :SERVER_INDEX => server_index).first
      message("already used coupon group. USER_NO:" + user_no + " coupon_string:" + coupon_string + " coupon_group:" + @coupon_instance.COUPON_GROUP + " server_index:" + server_index, 100060)
    return nil
    end
     
    @coupon_instance.USER_NO = user_no
    @coupon_instance.TIME = Time.now
    @coupon_instance.SERVER_INDEX = server_index
    @coupon_instance.save
    return @coupon_instance
  end
  
  def issue
    count = params[:count].to_i
    @coupon_instances = Array.new

    group_hex = SecureRandom.hex(5)
    
    n = 0
    while n < count
      hex = SecureRandom.hex(5)
      @coupon_instance = CouponInstance.where(:COUPON_STRING => hex).first
      if @coupon_instance != nil
        next
      end
      
      @coupon_instance = CouponInstance.new(:COUPON_INDEX => sequence("coupon_instances"), :REWARD => composite_reward_params(), :COUPON_STRING => hex, :COUPON_GROUP => group_hex)
      @coupon_instance.save
      
      
      @coupon_instances.push(@coupon_instance)
      n += 1
    end
    
    respond_to do |format|
      format.html 
      format.json { render json: @coupon_instances }
    end
  end

  def use
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    @server_list = ServerList.where(:SERVER_TYPE => "COUPON").first
    if @server_list == nil
      return error("not find coupon server on server_list. ", 120001)
    end
    
    ip=Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    @this_server = ServerList.where("#{column_name("ADDRESS")} like '%#{ip.ip_address}%'").first
    if @this_server == nil
      return error("not find this server on server_list. " + ip.ip_address, 120001)
    end
    
    if @server_list.ADDRESS == @this_server.ADDRESS
      @coupon_instance = use_real(params[:user_no], params[:coupon_string], @this_server.INDEX)
      if @coupon_instance == nil
        return
      end 
      
      res_json = @coupon_instance.to_json 
    else
      begin
        address = @server_list.ADDRESS + "coupon/use_relay.json" + "?coupon_string=#{params[:coupon_string]}&user_no=#{params[:user_no]}&server_index=#{@this_server.INDEX}"
        res = RestClient.get(address.to_s)
        debug_logger(res.to_s)
        res_json = JSON.parse(res.to_s)
      rescue => e
        res = e.response
        #debug_logger(res.to_s)
        res_json = JSON.parse(res.to_s)
      end
    end
    
    debug_logger(res_json)

    if res_json["code"] != nil
      return error("coupon/use failed. " + res_json.to_s, res_json["code"].to_i)      
    end
    
    if res_json["error"] != nil
      return error("raised error. ERROR:" + res_json["error"], 120001)
    end

    hash = Hash.new
    if res_json.class == String
      res_json.delete('"').split(',').each do |pair|
        key,value = pair.split(/:/)
        hash[key] = value
      end
    elsif res_json.class == Hash
      hash = res_json
    else
      return error("invalid response. response:" + res_json, 120001)
    end
        
    user_no = params[:user_no]
    sender_no = 1
    reward = hash["REWARD"]
    title = "쿠폰 보상"
    content = "쿠폰 입력 보상입니다."
    icon = "icon"
    end_date = Time.now + (60 * 60 * 24 * 3)
    mail_type = "COUPON"
    if false == send_to_mail(user_no,sender_no,title,content,reward,icon,end_date,mail_type)
      return message("can`t send mail. USER_NO:" + params[:user_no] + " coupon_string:" + params[:coupon_string], 100062)
    end
    
    respond_to do |format|
      format.html 
      format.json { render json: res_json }
    end
  end
  
  def show
    @coupon_instances = CouponInstance.where(:COUPON_INDEX => params[:coupon_no]) 
    respond_to do |format|
      format.html 
      format.json { render json: @coupon_instances }
    end
  end

  def find_by_code
    @coupon_instances = CouponInstance.where(:COUPON_STRING => params[:coupon_string]) 
    respond_to do |format|
      format.html 
      format.json { render json: @coupon_instances }
    end
  end

  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @coupon_instances = CouponInstance.where(:USER_NO => user_no) 
    respond_to do |format|
      format.html 
      format.json { render json: @coupon_instances }
    end
  end
  
  
  def issue_list
    @coupon_instances = near_date_data("#{params[:start_date]} #{params[:start_time]}", "#{params[:end_date]} #{params[:end_time]}", CouponInstance, "updated_at")
        
    respond_to do |format|
      format.html 
      format.json { render json: @coupon_instances }
    end
  end
  
end
