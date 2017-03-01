class MailController < ApplicationController
  before_action :auth_check, except: [:send_mail, :send_mail_all, :send_mail_list, :send_mail_level, :record, :find_by_nickname]
  before_action :ip_check, only: [:send_mail, :send_mail_all, :send_mail_list, :send_mail_level]

  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @mail_instances = get_mails(user_no)

    respond_to do |format|
      format.html 
      format.json { render json: @mail_instances }
    end
  end

  #유저에서 부르므로 안씁니다 15.11.24
  def all  
    @mail_instances = get_mails(params[:user_no])    
    respond_to do |format|
      format.html 
      format.json { render json: @mail_instances }
    end
  end
  
  def get_mails(user_no)
    time_stamp = Time.now
    return MailInstance.where("#{column_name("USER_NO")} = #{user_no} and #{column_name("OPENED")} like '%0%' and #{column_name("END_DATE")} > '#{time_stamp}'")
  end

  def record
    user_no = nickname_to_user_no(params[:nickname])
    @mail_instances = MailInstance.where(:USER_NO => user_no)

    respond_to do |format|
      format.html 
      format.json { render json: @mail_instances }
    end
  end

  def receive
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user." + params[:user_no], 100015)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not find character." + params[:character_no], 100019)
    end
    
    @mail_instance = MailInstance.where(:MAIL_NO => params[:mail_no]).first
    if @mail_instance == nil
      return error("not find mail_no: " + params[:user_no], 100034)
    end
    
    if @mail_instance.END_DATE < Time.now
      return message("expired mail. mail_no: " + params[:user_no] + " mail_instance: " + @mail_instance.to_s, 100035)
    end

    reward_index = params[:reward_index].to_i
    reward = @mail_instance.REWARD.split("|")
    if reward_index >= reward.length
      return error("invalid reward index. mail_no: " + params[:user_no] + " mail_instance: " + @mail_instance.to_s, 100036)
    end

    opened = @mail_instance.OPENED.split("|")
    if reward_index >= opened.length
      return error("invalid reward state. mail_no: " + params[:user_no] + " mail_instance: " + @mail_instance.to_s, 100037)
    end
    
    if opened[reward_index] != "0"
      return message("already opened mail. mail_no: " + params[:user_no] + " mail_instance: " + @mail_instance.to_s, 100038)
    end
        
    reward_type, reward_value, argument = reward_parsing(reward[reward_index], @character)

    if reward_type == "MONSTER" || reward_type == "ITEM" || reward_type == "GACHA"
      check = check_more_than_max_value(@user)
      if check == false
        if @user.CACHE_MONSTER_SLOT >= @user.EXT_MONSTER_SLOT
          return error("more than max value in inven monster", 100078)
        elsif @user.CACHE_ITEM_SLOT >= @user.EXT_ITEM_SLOT
          return error("more than max value in inven item", 100079)
        end
      end
    end

    result = Hash.new
    if add_item(result, @user, reward_type, reward_value, argument) == false
      return
    end
    
    opened[reward_index] = 1

    reward_result = String.new
    for n in 0...opened.length    
      reward_result = reward_result + opened[n].to_s + "|"
    end
    
    if reward_result.size != 0
      reward_result[reward_result.rindex("|")] = ''
    end
    
    @mail_instance.OPENED = reward_result
    @mail_instance.save
    
    @user.save
    
    log_to_db("MAIL_RECEIVE", @mail_instance.to_json, @user, @character)
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end
  
  def receive_all
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user." + params[:user_no], 100015)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not find character." + params[:character_no], 100019)
    end
    
    @mail_instances = get_mails(params[:user_no])    

    hash = Hash.new
    
    @mail_instances.each { |x|
      
      reward = x.REWARD.split("|")
      
      for n in 0..reward.length-1
        
        reward_type = reward[n].split("_")

        # 카테고리 확인하여 거름
        if (params[:mail_category] == "STAMINA")
          if(reward_type[0] != "SA" && reward_type[0] != "SS" && reward_type[0] != "SP")
            next
          end
        elsif(params[:mail_category] == "ITEM")
          if(reward_type[0] != "I")
            next
          end
          if(@user.CACHE_ITEM_SLOT >= @user.EXT_ITEM_SLOT)
              # 장비 보유량 초과
              next
          end
        elsif(params[:mail_category] == "GOLD")
          if(reward_type[0] != "G" && reward_type[0] != "D" && reward_type[0] != "FP")
            next
          end
        elsif(params[:mail_category] == "GACHA") # GACHA는 사실 일괄 수령을 할 수 없다
          if(reward_type[0] != "M" && reward_type[0] != "GC")
            next
          end
          if(@user.CACHE_MONSTER_SLOT >= @user.EXT_MONSTER_SLOT)
              # 요괴 보유량 초과
              next
          end
        end
        
        # 오픈 확인
        opened = x.OPENED.split("|")
        if opened[n] != "0"
          next
        end
        
        reward_type, reward_value, argument = reward_parsing(reward[n], @character)
        if add_item(hash, @user, reward_type, reward_value, argument) == false
          next
        end
       
        opened[n] = "1"
        
        reward_result = String.new
        for m in 0...opened.length    
          reward_result = reward_result + opened[m].to_s + "|"
        end
      
        if reward_result.size != 0
          reward_result[reward_result.rindex("|")] = ''
        end
      
        x.OPENED = reward_result
        x.save
        
      end
    }
    
    @user.save
    
    result = Hash.new
    add_result(result, "REWARD_TYPE", hash)
    
    @mail_instances = @mail_instances = get_mails(params[:user_no])   
    add_result(result, "MAIL", @mail_instances)
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end

  def real_send_mail(user)
    @sender = UserInstance.where(:USER_NO => params[:sender_user_no]).first
    if @sender == nil
      return error("not find user." + params[:user_no], 100014)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end    
    
    @character_info = CharacterInfo.where(:CHARACTER_ID => @sender.LASTEST_CHR_ID).first
    if @character_info == nil
      return error("invalid character_info:" + @sender.LASTEST_CHR_ID, 100016)
    end
    
    @actor_status_script = ActorStatusScript.where(:index => @character_info.ACTOR_ID).first
    if @actor_status_script == nil
      return error("invalid character_info:" + @character_info.ACTOR_ID.to_s + " " + params[:user_no], 100018)
    end
    
    end_date = Time.now + (60 * 60 * 24 * 3)

    reward_str = composite_reward_params()
    opened_str = String.new
    reward_str.split("|").each do |str|
      if opened_str.size != 0
        opened_str += "|"
      end
      opened_str += "0"
    end
    
    mail_instance = MailInstance.new( :MAIL_NO => sequence("mail_instances"), :USER_NO => user.USER_NO, :TITLE => params[:title], :CONTENT => params[:content],
     :REWARD => reward_str, :SENDER_ACTOR_ID => @actor_status_script.index, :SENDER => @sender.NICKNAME, :SENDER_USER_NO => @sender.USER_NO, :OPENED => opened_str, :END_DATE => end_date,
     :MAIL_TYPE => "PRESENT")
    mail_instance.save
    
    log_to_db("GMTOOL_MAIL_SEND", mail_instance.to_json, @sender, @character)
    
    return mail_instance
  end

  def send_mail
    user_no = nickname_to_user_no(params[:nickname])
    user = UserInstance.where(:USER_NO => user_no).first
    if user == nil
      return error("not find user." + user_no, 100013)
    end
    
    if false == real_send_mail(user)
      return
    end
    
    message("send_mail success", 0)
  end
  
  def send_mail_list
    nicknames = params[:nickname].split(",")
    nicknames.each do |nickname|
      user_no = nickname_to_user_no(nickname)
      user = UserInstance.where(:USER_NO => user_no).first
      if user == nil
        return error("not find user." + user_no, 100013)
      end
      
      if false == real_send_mail(user)
        return
      end
    end
    
    message("send_mail_list success", 0)
  end
  
end
