class FriendController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname]
  before_action :ip_check, only: [:find_by_nickname]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @list1 = FriendInstance.where(:USER_NO => user_no)
    @list2 = FriendInstance.where(:FRIEND_USER_NO => user_no)

    @friend_instances = @list1 + @list2
    
    respond_to do |format|
      format.html 
      format.json { render json: @friend_instances }
    end
  end
  
  def adventurer 
  end
   
  def get
    #사실 하트비트에서 사용되어야함 
     
    user_no = params[:user_no]    
    #update_time = params[:update_time].to_datetime
    
    #@list1 = FriendInstance.where("#{column_name("USER_NO")} = #{user_no} AND #{column_name("updated_at")} > #{update_time}")  
    #@list2 = FriendInstance.where("#{column_name("FRIEND_USER_NO")} = #{user_no} AND #{column_name("updated_at")} > #{update_time}")

    @list1 = FriendInstance.where(:USER_NO => user_no)  
    @list2 = FriendInstance.where(:FRIEND_USER_NO => user_no)
    
    #친구 리스트의 유저가 삭제되어있다면 STATE 변경
    @list1.each() do |instance| 
      @user = UserInstance.where(:USER_NO =>instance.FRIEND_USER_NO).first 
      if @user == nil
        instance.STATE = -1
        instance.save
      end 
    end 
    
    @list2.each() do |instance| 
      @user = UserInstance.where(:USER_NO =>instance.USER_NO).first 
      if @user == nil
        instance.STATE = -1
        instance.save
      end 
    end 

    @friend_instances = @list1 + @list2
        
    respond_to do |format|
      format.html 
      format.json { render json: @friend_instances }
    end 
  end
  
  #친구 신청
  def propose
      
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end

    @target = UserInstance.where(:USER_NO => params[:friend_no]).first
    if @target == nil
      return error("not find target_no: " + params[:friend_no], 100023)
    end
    
    max_propose_count = 30
    
    @list_my_propose = FriendInstance.where("#{column_name("USER_NO")} = #{@user.USER_NO} AND #{column_name("STATE")} = #{1}")
    if @list_my_propose.count >= max_propose_count
      return error("full your propose count.",  120005)
    end 
    
    @list_target_received_propose = FriendInstance.where("#{column_name("FRIEND_USER_NO")} = #{@target.USER_NO} AND #{column_name("STATE")} = #{1}")
    if @list_target_received_propose.count >= max_propose_count
      return error("full target's received propose count.", 120006)
    end
        
    @already_friend = find_friend_instance(params[:user_no], @target.USER_NO)    
    
    if @already_friend != nil 
      if @already_friend.STATE == 0
        return message("already friend user : " + params[:friend_no], 100024)
      elsif @already_friend.STATE == 1
        return message("already propose user : " + params[:friend_no], 100025) 
      elsif @already_friend.STATE == -1
        #이미 친구 인스턴스가 있지만 삭제한 친구인 경우 다시 내가 친구 신청을 거는 걸로 갱신
        
        @already_friend.USER_NO = params[:user_no]
        @already_friend.FRIEND_USER_NO = @target.USER_NO
        @already_friend.STATE = 1
        @already_friend.save
        
      end  
    #이미 친구 인스턴스가 없는 경우
    else
      @friend = FriendInstance.new( :FRIEND_NO => sequence("friend_instances"), :USER_NO => params[:user_no], :FRIEND_USER_NO => @target.USER_NO, :STATE => 1, 
      :USER_SEND_POINT_DATE => Time.new(2015), :FRIEND_USER_SEND_POINT_DATE => Time.new(2015) , :USER_ADV_TOGETHER_DATE => Time.new(2015) , :FRIEND_USER_ADV_TOGETHER_DATE => Time.new(2015) , :IS_BOT => 0)

      @friend.save 
    end    
    
    log_to_db("FRIEND_PROPOSE", @friend.to_json, @user, @character)
    
    respond_to do |format|
      format.html 
      format.json { render json: @friend }
    end
    
  end
  
  #친구 수락
  def answer
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    @friend = find_friend_instance(params[:user_no],params[:friend_user_no])
    
    if @friend == nil
      return error("not find friend_user : " + params[:friend_user_no], 100023)
    end
      
    if @friend.STATE != 1
      return error("invalid friend state : " + params[:friend_user_no], 100026)
    end

    if is_available_answer(params[:user_no]) == false
      return message("I'm max friend count", 100027)
    end
    
    if is_available_answer(params[:friend_user_no]) == false
      return message("that user is max friend count", 100028)
    end
       
    @friend.STATE = 0
    @friend.save
    
    log_to_db("FRIEND_ANSWER", @friend.to_json, @user, @character)
    
    respond_to do |format|
      format.html 
      format.json { render json: @friend }
    end 
  end
  
  #친구 삭제 혹은 친구 신청 거부로 사용해도 될듯.
  def delete
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    @friend = find_friend_instance(params[:user_no], params[:friend_user_no])        
    
    if @friend == nil      
      return error("not find friend_user : " + params[:friend_user_no], 100023)   
    end
   
    case params[:delete_type]
    when "delete" 
      @user.FRIEND_DELETE_COUNT = params[:delete_count]
      @user.save
      
      #친구를 삭제했습니다.
      message("deleted friend. user_no: " + params[:user_no] + " friend_user_no: " + params[:friend_user_no], 100001)
      
      @friend.STATE = -1
      @friend.save
      
    when "reject"
      #(타 유저가 보낸)친구 요청을 거절하였습니다. 100056
      message("deleted friend. user_no: " + params[:user_no] + " friend_user_no: " + params[:friend_user_no], 100056)
      
      @friend.STATE = -1
      @friend.save

    when "cancel"
      #(내가 보낸)친구 요청을 취소하였습니다. 100057
      message("deleted friend. user_no: " + params[:user_no] + " friend_user_no: " + params[:friend_user_no], 100057)
      
      @friend.STATE = -1
      @friend.save

    else
      return error("not valid delete_type : " + params[:delete_type], 120001)   
    end 
     
    #@friend.destroy
    
    log_to_db("FRIEND_DELETE", @friend.to_json, @user, @character)
  end 
  
  def sendgift
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    #선물을 받을 유저
    @user = UserInstance.where(:USER_NO => params[:friend_user_no]).first
    if @user == nil
      return error("not fin user_no : " + params[:friend_user_no], 100000)
    end   
    
    #선물을 보내는 유저
    @sender = UserInstance.where(:USER_NO => params[:user_no]).first
    if @sender == nil
      return error("not find user." + params[:user_no], 100023)
    end
    
    #둘이 친구 사이니?
    @friend = find_friend_instance(params[:user_no], params[:friend_user_no])
    
    if @friend == nil
      #친구 인스턴스가 없는 경우
      return error("not find friend_user : " + params[:friend_user_no], 100023)
    elsif @friend != nil && @friend.STATE != 0
      #친구 인스턴스는 있지만 친구 사이가 아닌 경우
      return error("not find friend_user : " + params[:friend_user_no], 100023)
    end  
    
    #선물
    @gift = ShopItem.where(:SHOP_ITEM_ID => params[:shop_item_id]).first
    if @gift == nil
      return error("not find shop item : " + params[:shop_item_id], 100042)
    end
      
    now_time = Time.now
    if now_time < @gift.START_DATE || @gift.END_DATE < now_time
      return message("not sale period. " + params[:user_no], 100043)
    end
    
    capacity = @gift.CAPACITY 
    reward = ""
    
    case @gift.SHOP_CATEGORY 
      
    when "DIAMOND"
      reward = "D_" + capacity.to_s
    when "GOLD"
      reward = "G_" + capacity.to_s
    when "STAMINA_ADVENTURE"
      reward = "SA_" + capacity.to_s
    when "STAMINA_PVP"
      reward = "SP_" + capacity.to_s
    when "STAMINA_SPECIAL"
      reward = "SS_" + capacity.to_s
    when "GACHA" 
      
      gacha_id = @gift.GACHA
      reward_one = "GC_" + gacha_id.to_s            
      reward = reward_one  
      for n in 0...capacity - 1
        reward += '|'+ reward_one
      end

    else
      return error("not available reward type : " + reward_type) 
    end 
    
    mail_type = "PRESENT"
    
    #이건 나한테 보내는거 테스트용  to do remove
    #send_to_mail(params[:user_no], params[:friend_user_no], "선물보냄","선물보냄", reward, "UI/Textures/Home_Ico_PlayPoint", Time.now + (60 * 60 * 24 * 3),mail_type)
    
    send_to_mail(params[:friend_user_no], params[:user_no], "선물보냄","선물보냄", reward, "UI/Textures/Home_Ico_PlayPoint", Time.now + (60 * 60 * 24 * 3),mail_type)
    
    log_to_db("FRIEND_GIFT", @gift.to_json, @sender, @character)
    
    respond_to do |format|
      format.html 
      format.json { render json: @friend }
    end
  
  end 
  
  def sendpoint
    #포인트를 받을 유저
    @user = UserInstance.where(:USER_NO => params[:friend_user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:friend_user_no], 100000)
    end
        
    #포인트를 보내는 유저(나)
    @sender = UserInstance.where(:USER_NO => params[:user_no]).first
    if @sender == nil
      return error("not find user. USER_NO:" + params[:user_no], 100023)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end

    @friend = find_friend_instance(params[:user_no], params[:friend_user_no])

    if @friend == nil
      #친구 인스턴스가 없는 경우
      return error("not find friend_user : " + params[:friend_user_no], 100023)
    elsif @friend != nil && @friend.STATE != 0
      #친구 인스턴스는 있지만 친구 사이가 아닌 경우
      return error("not find friend_user : " + params[:friend_user_no], 100023)
    end  
    
    mail_type = "FRIEND"
    #내가 USER_NO 인가 FRIEND_USER_NO 인가
    if params[:user_no].to_i == @friend.USER_NO
      
      delta_time = (Time.now.utc - @friend.USER_SEND_POINT_DATE).to_i 
      
      if delta_time >= 24
        
        send_to_mail(params[:friend_user_no], params[:user_no], "우포보냄","우포보냄", "FP_5", "UI/Textures/Home_Ico_PlayPoint", Time.now + (60 * 60 * 24 * 3),mail_type) 

        @friend.USER_SEND_POINT_DATE = Time.now
        @friend.save     
        
        respond_to do |format|
          format.html 
          format.json { render json: @friend }
        end
       
      else
        #시간이 아직 안된거임
        return message("not available time", 100029)
      end
              
    else
      
      delta_time = (Time.now.utc - @friend.FRIEND_USER_SEND_POINT_DATE).to_i
      if delta_time >= 24
        
        send_to_mail(params[:friend_user_no], params[:user_no], "우포보냄","우포보냄", "FP_5", "UI/Textures/Home_Ico_PlayPoint", Time.now + (60 * 60 * 24 * 3),mail_type)
        
        @friend.FRIEND_USER_SEND_POINT_DATE = Time.now
        @friend.save
        
        respond_to do |format|
          format.html 
          format.json { render json: @friend }
        end
           
      else
         #시간이 아직 안된거임 
         return message("not available time", 100029)
      end 
      
    end
    
    log_to_db("FRIEND_SEND_POINT", @friend.to_json, @sender, @character)
     
  end  
  
  #친구 추가가 가능한지 최대친구 수로 판별
  def is_available_answer(user_no)
    @user = UserInstance.where(:USER_NO => user_no).first
    if @user == nil
      return error("not find user_no: " + params[:user_no], 100000)
    end
    
    max_count = @user.EXT_FRIEND_COUNT
    
    @list1 = FriendInstance.where("#{column_name("USER_NO")} = #{user_no} AND #{column_name("STATE")} = #{0}")
    @list2 = FriendInstance.where("#{column_name("FRIEND_USER_NO")} = #{user_no} AND #{column_name("STATE")} = #{0}")
    
    cur_count = @list1.count + @list2.count

    if max_count > cur_count
      return true
    else
      return false
    end
            
  end
    
end