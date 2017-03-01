class UserController < ApplicationController
  before_action :auth_check, except: [:sign_up, :sign_in, :find_by_nickname, :nickname_duplicate_check, :deactivate]
  before_action :ip_check, only: [:find_by_nickname, :deactivate]

  def issue_auth_key(user_no, private_key)
    auth_instance = AuthInstance.where(:USER_NO => user_no).first
    auth_key = SecureRandom.hex(10)
    remote_ip = request.remote_ip.encode('utf-8')

    if auth_instance == nil
      auth_instance = AuthInstance.new(:USER_NO => user_no, :PRIVATE_KEY => private_key, :AUTH_KEY => auth_key, :IP => remote_ip)
    else
      if Rails.env.development?
      else 
        if private_key != auth_instance.PRIVATE_KEY
          return error("invalid private key. db : " + auth_instance.PRIVATE_KEY + " params: " + private_key, 120001)
        end
      end
      
      auth_instance.IP = remote_ip
      auth_instance.AUTH_KEY = auth_key
    end
    
    logger.info("issue_auth_key. user_no : " + user_no.to_s + " auth_key : " + auth_key + " request_params : " + request.path_parameters.to_s + " query_params : " + request.query_parameters.to_s)
    
    auth_instance.save
    return auth_instance
  end
  
  
  
  def sign_in    
    result = Hash.new
    
    sign_in_get_data(@user, result ,params[:user_id])
    
    if @user == nil            
      respond_to do |format|
        format.html
        format.json { render json: { "not_found_user" => 0 }.to_json }
      end
      return false
    end       
            
    auth_instance = issue_auth_key(@user.USER_NO, params[:private_key])
    if auth_instance == false
      return false
    end
    
    @user_and_auth = @user.as_json.merge("AUTH_KEY" => auth_instance.AUTH_KEY)
    result[0]["RESULT_VALUE"] = @user_and_auth 

    @event_instances = EventInstance.where("#{column_name("START_DATE")} < '#{Time.now.utc}' AND #{column_name("END_DATE")} > '#{Time.now.utc}'")
    @event_instances.each do |event|
      if event.EVENT_TYPE == "LOGIN"
        if nil != LogInstance.where(:USER_NO => @user.USER_NO, :LOG_TYPE => "LOGIN_EVENT", :VALUE => event.EVENT_NO).first
          next
        end
        
        if false == send_to_mail(@user.USER_NO, 1, "EVENT 보상", "LOGIN EVENT", event.REWARD, "icon", Time.now + (60 * 60 * 24 * 3), "EVENT")
          return
        end
        log_to_db("LOGIN_EVENT", event.EVENT_NO, @user, nil)
      end
    end


    log_to_db("SIGN_IN", @user.to_json, @user, nil)

    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end
  
#========================================================================================================================================

  def sign_in_get_data(user, result, user_id)
       
    user = get_user(result, user_id)

    #user = result[ result.length - 1 ]["RESULT_VALUE"]
    if user == nil
      return user
    else
      get_character_list(result, user)
      @character_hash = result[result.length - 1]["RESULT_VALUE"]
      if @character_hash == nil
        return error("not find character_instnace_list in hash", 0)
      end
      
      get_monster(result, user)
      get_item(result, user)
      get_skill(result, user, @character_hash)
      get_mastery(result, user, @character_hash)
      get_stage(result, user, @character_hash)
      @stage_clear_hash = result[result.length - 1]["RESULT_VALUE"]
      if @stage_clear_hash == nil
        return error("not find @stage_clear in hash", 0)
      end  
      
      @update_time = Time.new(1999)
      get_friend(result, user, @update_time)
      get_mail(result, user, @update_time)
      
      get_pvp(result)
      get_tutorial(result, user)
  
      get_quest(result, user, @stage_clear_hash)
    end
  end
  
#========================================================================================================================================

  
  def sign_up
    connect_restrict = ConnectRestrict.where(:TYPE => "DEVICE_ID", :VALUE => params[:device_id]).first
    if connect_restrict != nil
      return error("restrict user. device_id : " + params[:device_id], 120004)
    end
    
    max_user_connect_restrict = ConnectRestrict.where(:TYPE => "MAX_USER").first
    if max_user_connect_restrict != nil
      if max_user_connect_restrict.USER < UserInstance.all.count
        return error("over user. count : " + UserInstance.all.count, 120003)
      end
    end
    
    @user = UserInstance.where(:USER_ID => params[:user_id]).first
    if @user != nil
      return error("already exist user_id : " + params[:user_id], 100055)
    end
    
    #----------------------------------------------------------------------
    # 예외 처리를 어떤식으로 해야 할까
    party_min = 5
    item_min = 5
    mail_min = 5
    friend_min = 5
    
    get_min_value().each do |minvalue|
      if(minvalue.MAX_SLOT_TYPE == "PARTY")
        party_min = minvalue.NEXT_EXT_SLOT
      elsif(minvalue.MAX_SLOT_TYPE == "EQUIP")
        item_min = minvalue.NEXT_EXT_SLOT
      elsif(minvalue.MAX_SLOT_TYPE == "MAIL")
        mail_min = minvalue.NEXT_EXT_SLOT
      elsif(minvalue.MAX_SLOT_TYPE == "FRIEND")
        friend_min = minvalue.NEXT_EXT_SLOT
      end
    end

    #----------------------------------------------------------------------
    # 임시로 몬스터 보유량 증가
    user_no = sequence("user_instances")
    @user = UserInstance.new(:USER_NO => user_no, :USER_ID => params[:user_id], :NICKNAME => params[:nickname], :USER_LV => 1, :EXP => 0,
        :FRIEND_POINT => 0, :STAMINA_PVP => 5, :STAMINA_ADVENTURE => 5, :STAMINA_SPECIAL => 5, :EXT_MONSTER_SLOT => party_min, :EXT_ITEM_SLOT => item_min, :EXT_FRIEND_COUNT => friend_min, :POSTBOX_SLOT => mail_min, 
        :CASH => 0, :MONEY => 0, :MASTERY_RESET_COUNT => 0,
        :STAMINA_ADVENTURE_TIME => Time.now, :STAMINA_PVP_TIME => Time.now, :STAMINA_SPECIAL_TIME => Time.now,  
        :LASTEST_ACTIVE_TIME => Time.now, :PERMISSION => "USER", :LASTEST_CHR_ID => 1, :LASTEST_CHR_LV => 1,
        :CACHE_MONSTER_SLOT=> 0, :CACHE_ITEM_SLOT => 0,:CACHE_FRIEND_SLOT => 0,
        :MASTERY_POINT => 1, :INFI_TOWER_FLOOR => 0, :FRIEND_DELETE_COUNT => 0)    
    #유저 지급 인스턴스도 new 합니당 dhchoi
    @user_give_instance = UserGiveInstance.new(:USER_NO => user_no, :GIVE_REPLY => "false")
    @user_give_instance.save

    character_no = sequence("character_instances")
    @character = CharacterInstance.new( :CHARACTER_NO => character_no, :USER_NO => user_no, :CHARACTER_ID => 1, 
    :LEVEL => 1, :EXP => 0, :LASTEST_ACTIVE_TIME => Time.now, :MASTERY_GROUP_ID => 1, :STAGE_INSTANCE_NO => 0,
    :PARTY_MONSTER_ID => "NONE" , :COSTUME_ID => 0)
    
    @pvp_instances = PvpInstance.new(:CHARACTER_NO => character_no, :CHARACTER_LV => 1, :CHARACTER_ID => 1, :USER_NICKNAME => params[:nickname], :USER_LV => 1, :RATING => 1000, :PARTY_ATTACKER => 0, :ATTACKER_POWER => 1577, :PARTY_DEFENDER => 0, :DEFENDER_POWER => 1577, 
                                     :SEASON_NUM => 0, :IS_SUCCESSION_VICTORY => "true", :SUCCESSION_COUNT => 0, :VICTORY_COUNT => 0, :DEFEAT_COUNT => 0, :CUR_MATCH_NO => 1, :RANK => 0 , :COSTUME_ID => 0, :USER_NO => user_no)
    
    @character_info = CharacterInfo.where(:CHARACTER_ID => 1).first
    if @character_info == nil
      return error("invalid character_info:" + params[:user_no], 100016)
    end
    
    @actor_status_script = ActorStatusScript.where(:index => @character_info.ACTOR_ID).first
    if @actor_status_script == nil
      return error("invalid character_info:" + @character_info.ACTOR_ID.to_s + " " + params[:user_no], 100018)
    end
    
    str_skill = @actor_status_script.skill_list.split("|")
    for i in 0...str_skill.length
      @skill_instance = SkillInstance.new( :SKILL_NO => sequence("skill_instances"), :SKILL_ID => str_skill[i], :CHARACTER_NO => @character.CHARACTER_NO, :SLOT_NO => i, :SKILL_LEVEL => 1)
      @skill_instance.save
    end
    
    result = Hash.new
    reward_item(user_no, "M_109", result)
    reward_item(user_no, "M_1", result)
    
    #----------------------------------------
    #몬스터 전체 지급
    #for n in 1..154
    #  monster_no = "M_" + n.to_s
    #  debug_logger(monster_no)
    #  max_level_monster_reward(user_no, monster_no, result)
    #end
    
    #특정 몬스터 30마리
    #for n in 0 .. 16
      #max_level_monster_reward(user_no, "M_146", result)    
      #max_level_monster_reward(user_no, "M_7", result)        
      #max_level_monster_reward(user_no, "M_57", result)
      #max_level_monster_reward(user_no, "M_76", result)
      #max_level_monster_reward(user_no, "M_77", result)
      #max_level_monster_reward(user_no, "M_127", result)
    #end   
    #----------------------------------------
    @mastery_instance = MasteryInstance.new(:MASTERY_NO => sequence("mastery_instances"), :GROUP_NO => 1, :USER_NO => user_no, :CHARACTER_NO => @character.CHARACTER_NO, :MASTERY => "NONE")
    
    @stage_clear_instance = StageClearInstance.new(:USER_NO => user_no, :CHARACTER_NO => character_no, :CLEAR_STAGE => "", :STAGE_SCORE => "", :PLAY_STAGE => "", :LAST_DATE => Time.now )
    @stage_clear_instance.save

    @pvp_instances.save
    @mastery_instance.save
    @character.save
    

    @user.save

    #빌드용으로 잠시 롤백
    result = Hash.new
    
    sign_in_get_data(@user, result , params[:user_id])
    private_key = params[:private_key]
    auth_instance = issue_auth_key(user_no, private_key)
    
    @user_and_auth = @user.as_json.merge("PRIVATE_KEY" => private_key, "AUTH_KEY" => auth_instance.AUTH_KEY)
    result[ 0 ]["RESULT_VALUE"] = @user_and_auth 

    log_to_db("SIGN_UP", @user.to_json, @user, nil)

    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
    
  end

  def heartbeat
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. " + params[:user_no], 100000)
    end
    
    @version_instance = VersionInstance.where(:VALUE => params[:version]).first
    if @version_instance == nil
      return invalid_version("invalid version. " + params[:version].to_s, 120002)
    end
            
    #하트비트에서뿐만이 아니라, 스테이지 입장 시에도 스테미너 시간 검증이 필요하기에 application_controller로 검증로직을 옮깁니다.      
    #LASTEST_ACTIVE_TIME은 하트비트를 일정하게 호출하고, 친구와 우편함을 긁어오는데 민감한 역할을 하는 부분이므로 하트비트에서만 변경시킬수 있습니다.            
    @user = stamina_check(@user)

    @update_time = @user.LASTEST_ACTIVE_TIME.utc #utc를 쓰는 이유는 updated_at과의 비교를 위함입니다.    
    debug_logger("최종 update_time : " + @update_time.to_s)  
     
    @user.LASTEST_ACTIVE_TIME = Time.now 
    @user.save
      
    @list1 = FriendInstance.where("#{column_name("USER_NO")} = #{@user.USER_NO} AND #{column_name("updated_at")} > '#{@update_time}'")  
    @list2 = FriendInstance.where("#{column_name("FRIEND_USER_NO")} = #{@user.USER_NO} AND #{column_name("updated_at")} > '#{@update_time}'") 
              
    @list1.each do |instance| 
      @friend = UserInstance.where(:USER_NO =>instance.FRIEND_USER_NO).first 
      if @friend == nil
        instance.STATE = -1
        instance.save
      end 
    end 
    
    @list2.each do |instance| 
      @friend = UserInstance.where(:USER_NO =>instance.USER_NO).first 
      if @friend == nil
        instance.STATE = -1
        instance.save
      end 
    end 

    @friend_instances = @list1 + @list2
    
    time_stamp = Time.now
    @mail_instances = MailInstance.where("#{column_name("USER_NO")} = #{@user.USER_NO} and #{column_name("OPENED")} like '%0%' and #{column_name("END_DATE")} > '#{time_stamp}' and #{column_name("updated_at")} > '#{@update_time}'")    
     
    result = Hash.new
      
    add_result(result, "USER", @user)
    add_result(result, "FRIEND", @friend_instances)  
    add_result(result, "MAIL", @mail_instances)
      
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end

  def deactivate    
    @user_instance = UserInstance.where(:id => params[:format]).first
    if @user_instance == nil
      return error("not find id. " + params[:format], 100000)
    end
    
    @auth_instances = AuthInstance.where(:USER_NO => @user_instance.USER_NO)
    @auth_instances.each do |instance|
      instance.destroy
    end
    
    @item_instances = ItemInstance.where(:USER_NO => @user_instance.USER_NO)
    @item_instances.each do |instance|
      instance.destroy
    end
    
    # 내가 신청해서 맺어진 친구
    @friend_instances = FriendInstance.where(:USER_NO => @user_instance.USER_NO)
    @friend_instances.each do |instance|
      instance.destroy
    end
    
    # 신청 받아서 맺어진 친구
    @friend_instances = FriendInstance.where(:FRIEND_USER_NO => @user_instance.USER_NO)
    @friend_instances.each do |instance|
      instance.destroy
    end

    @character_instances = CharacterInstance.where(:USER_NO => @user_instance.USER_NO)

    @character_instances.each do |character|    
      @skill_instances = SkillInstance.where(:CHARACTER_NO => character.CHARACTER_NO)
      @skill_instances.each do |instance|    
        instance.destroy
      end
      character.destroy
    end
    
    @pvp_instances = PvpInstance.where(:USER_NO => @user_instance.USER_NO)
    @pvp_instances.each do |instance|
      instance.destroy
    end
    
    @monster_instances = MonsterInstance.where(:USER_NO => @user_instance.USER_NO)
    @monster_instances.each do |instance|
      instance.destroy
    end
    
    @mail_instances = MailInstance.where(:USER_NO => @user_instance.USER_NO)
    @mail_instances.each do |instance|
      instance.destroy
    end
    
    @stage_instances = StageInstance.where(:USER_NO => @user_instance.USER_NO)
    @stage_instances.each do |instance|
      instance.destroy
    end
    
    @stage_clear_instances = StageClearInstance.where(:USER_NO => @user_instance.USER_NO)
    @stage_clear_instances.each do |instance|
      instance.destroy
    end

    @quest_instances = QuestInstance.where(:USER_NO => @user_instance.USER_NO)
    @quest_instances.each do |instance|
      instance.destroy
    end

    @mastery_instances = MasteryInstance.where(:USER_NO => @user_instance.USER_NO)
    @mastery_instances.each do |instance|
      instance.destroy
    end

    @daycheck_instances = DaycheckInstance.where(:USER_NO => @user_instance.USER_NO)
    @daycheck_instances.each do |instance|
      instance.destroy
    end
       
    @user_instance.destroy
    
    respond_to do |format|
      format.all { render :nothing => true, :status => 200 }
    end
  end
  
  def lastestchr 
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user no: " + params[:user_no], 100000)
    end
    
    @user.LASTEST_CHR_ID = params[:lastest_chr_id]
    @user.LASTEST_CHR_LV = params[:lastest_chr_lv]
    @user.save 
    
    respond_to do |format|
      format.html 
      format.json { render json: @user }
    end
  end
  
  def get
    @user = UserInstance.where(:USER_NO => params[:find_user_no]).first
    if @user == nil
      return error("not find user no: " + params[:find_user_no], 100000)
    end
     
    respond_to do |format|
      format.html 
      format.json { render json: @user }
    end
  end
  
  def get_user_and_lastestchr 
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. user no : " + params[:user_no], 100000)
    end
    
    @find_user = UserInstance.where(:USER_NO => params[:find_user_no]).first
    if @find_user == nil
      return error("not find user. user no : " + params[:find_user_no], 100000)
    end
      
    @find_character = CharacterInstance.where(:USER_NO => params[:find_user_no], :CHARACTER_ID => @find_user.LASTEST_CHR_ID).first
    if @find_character == nil
      return error("not found character. user no : " + params[:find_user_no] + "character id : " + @find_user.LASTEST_CHR_ID, 100021)
    end
    
    result = Hash.new
    
    add_result(result, "USER", @find_user)
    add_result(result, "CHARACTER", @find_character)
    
    find_party = @find_character.PARTY_MONSTER_ID
    for at in 0...find_party.split('|').length
      party_char_no = find_party.split('|')[at]
      if party_char_no == 0
        next
      end
      
      @find_party = MonsterInstance.where(:MONSTER_NO => party_char_no).first
      if @find_party != nil
        add_result(result, "PARTY_CHARACTER", @find_party)
      end  
    end 
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
     
  end
  
  def getrandlist
    count = UserInstance.count    
    offset = rand(count)
    if count < offset + 10
      offset = count - 10
    end    
    
    @user = UserInstance.offset(offset).limit(10)
     
    @available_user = Hash.new
    @available_users_lastest_chr = Hash.new 
    
    @user.each do |user|
      if user.PERMISSION == "USER"
        @available_user[user.USER_NO] = user 
        
        @character = CharacterInstance.where(:USER_NO => user.USER_NO, :CHARACTER_ID => user.LASTEST_CHR_ID).first
        if @character == nil
          return error("not found character. user no : " + user.USER_NO + "character id : " + user.LASTEST_CHR_ID, 100021)
        end 
        @available_users_lastest_chr[user.USER_NO] = @character     
      
      end 
    end       
    
    if @available_user.count != @available_users_lastest_chr.count
      return error("not match result count USER and USER's LASTEST CHARACTER")
    end   
    
    result = Hash.new
    
    add_result(result, "USER", @available_user)
    add_result(result, "CHARACTER", @available_users_lastest_chr)
     
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end 
  end 
  
  def find_by_nickname
    @user_instances = nickname_like_user_instances(params[:nickname])
    
    respond_to do |format|
      format.html 
      format.json { render json: @user_instances }
    end     
  end
  
  def search
    if params[:my_nickname] == params[:search_nickname]
      return error("this is my nickname : " + params[:search_nickname], 100023)
    end   
   
    @search_user = UserInstance.where(:NICKNAME => params[:search_nickname]).first  
    if @search_user == nil || @search_user.PERMISSION != "USER" 
      return error("not found nickname : " + params[:search_nickname], 100023)
    end  
    
    @friend = find_friend_instance(@search_user.USER_NO, params[:user_no]) 
    if @friend != nil   
      if @friend.STATE == 1  
        return message("already existence friend instance", 100025)
      elsif @friend.STATE == 0
        return message("already friend", 100024)
      elsif @friend.STATE != -1
        return error("invalid state")
      end      
    end 
    
    @character = CharacterInstance.where(:USER_NO => @search_user.USER_NO, :CHARACTER_ID => @search_user.LASTEST_CHR_ID).first
    if @character == nil
      return error("not found character. user no : " + @search_user.USER_NO + "character id : " + @search_user.LASTEST_CHR_ID, 100021)
    end
     
    result = Hash.new
    
    add_result(result, "USER", @search_user)
    add_result(result, "CHARACTER", @character)  
        
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end    
  end
  
  #댓글유도 팝업 확인버튼 눌렀을때의 액션
  def reply_action 
    #gm 인스턴스 넘버 
    gm_no = 1
    
    user_no = params[:user_no].to_i
    @user_give_instance = UserGiveInstance.where(:USER_NO => user_no).first
    
    if @user_give_instance == nil
      return error("보상 지급 정보를 찾지 못했습니다", 100067)
    end
    
    if @user_give_instance.GIVE_REPLY == "true"
      return message("이미 보상을 받았습니다", 100066)
    end
      
    reward = "D_50"
    comment = "댓글작성 보상으로 다이아가 지급되었습니다"
    
    send_to_mail(user_no, gm_no, "댓글 보상", comment, reward, "icon", Time.now + (60 * 60 * 24 * 3),"")
    
    @user_give_instance.GIVE_REPLY = "true"
    @user_give_instance.save
    
    message("update success", 0)    
  end
  
  #유저 닉네임 중복검사
  def nickname_duplicate_check
    @user = UserInstance.where(:NICKNAME => params[:nickname]).first
    if @user != nil    
      respond_to do |format|
        format.html 
        format.json { render json: @user }
      end           
    
    else    
      message("no duplicate.", 0)  
    end        
  end
   
  def battle_info
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user no: " + params[:user_no], 100000)
    end
     
    @find_character = CharacterInstance.where(:CHARACTER_NO => params[:find_chr_no]).first
    if @find_character == nil
      return error("not found character no " + params[:character_no], 100021)
    end

    result = Hash.new

    add_result(result, "ITEM", ItemInstance.where(:CHARACTER_NO => @find_character.CHARACTER_NO))
    add_result(result, "MASTERY", MasteryInstance.where(:CHARACTER_NO => @find_character.CHARACTER_NO))
    add_result(result, "SKILL", SkillInstance.where(:CHARACTER_NO => @find_character.CHARACTER_NO))
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end   
     
  end 
    
end
