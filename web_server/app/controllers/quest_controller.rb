class QuestController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname]
  before_action :ip_check, only: [:find_by_nickname]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @quest_instances = QuestInstance.where(:USER_NO => user_no)

    respond_to do |format|
      format.html 
      format.json { render json: @quest_instances }
    end
  end

 def drop
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user." + params[:user_no], 100000)
    end

    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not find character." + params[:character_no], 100019)
    end

    @quest_instance = QuestInstance.where(:QUEST_NO => params[:instance_no]).first

    if @quest_instance == nil
      return error("not found @quest_instance", 100300)
    end

    @quest_info = QuestInfo.where(:QUEST_INFO_ID => @quest_instance.QUEST_INFO_ID).first

    if @quest_info == nil
      return error("not found quest_info", 100301)
    end

    if @quest_info.MAXVALUE > @quest_instance.QUEST_VALUE
      return error("MAXVALUE > QUEST_VALUE" ,100302 )
    else
      @quest_instance.CLEAR = "CLEAR_ABLE"
    end
    
    if @quest_instance.CLEAR != "CLEAR_ABLE"
      return error("clear is not state CLEAR_ABLE", 100302)
    end

    reward = @quest_info.REWARD
    # 보상

    reward_type, reward_value, argument = reward_parsing(reward)

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

    mail_type = ""

    if @quest_info.QUEST_APPLY_TYPE == "STAMP"
      mail_type << @quest_info.QUEST_APPLY_TYPE.to_s
    end

    if @quest_info.QUEST_APPLY_TYPE == "QUEST"
      @quest_schedule = QuestSchedule.where(:QUEST_SCHEDULE_ID => @quest_info.QUEST_SCHEDULE_ID).first

      if @quest_schedule == nil
        return error("not found @quest_schedule" + info.to_s, 100301)
      end

      mail_type << @quest_info.QUEST_APPLY_TYPE.to_s
      mail_type << "|"
      mail_type << @quest_schedule.QUEST_SCHEDULE_TYPE.to_s
    end

    user_no = params[:user_no]
    sender_no = 1

    title = "보상"
    content = "보상 처리"
    icon = "icon"
    end_date = Time.now + (60 * 60 * 24 * 3)
    
    if false == send_to_mail(user_no,sender_no,title,content,reward,icon,end_date,mail_type)
      return
    end

    @quest_instance.CLEAR = "CLEARED"
    @quest_instance.CLEAR_TIME = Time.now

    @quest_instance.save

    
    @next_quest_info = QuestInfo.where(:NEXT_QUEST_ID => @quest_instance.QUEST_INFO_ID).first

    if @next_quest_info != nil
      @quest_types = QuestType.where(:QUEST_TYPE_ID => @next_quest_info.QUEST_TYPE_ID).first
  
      if @quest_types == nil
        return error("not found @quest_types", 100301)
      end
      
      quest_value = 0
      if @quest_types.TYPE == "STAGE_CLEAR_COMPLETE"
        @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => params[:character_no]).first
        if @stage_clear_instance == nil
          return error("not find item " + params[:user_no], 100051)
        end
        
        play_stage = @stage_clear_instance.CLEAR_STAGE.split("|")
    
        stage_id = params[:stage_id]
        if nil != @stage_clear_instance.CLEAR_STAGE.index(quest_info[:GRADE].to_s)
          quest_value = quest_info[:MAXVALUE]
        end
      end
      
      if @next_quest_info.PREVIEW.to_i != 0
        quest_value = @quest_instance.QUEST_VALUE
      end
    
      @next_quest_instance = QuestInstance.new( :QUEST_NO => sequence("quest_instances"), :QUEST_INFO_ID => @next_quest_info.QUEST_INFO_ID, :USER_NO => params[:user_no],
       :TYPE => @quest_types.TYPE ,:QUEST_VALUE => quest_value,  :ACTIVE_TIME => Time.zone.now, :CLEAR => "NONE" , :CLEAR_TIME => Time.new(1990) , 
       :GRADE => @next_quest_info.GRADE , :QUEST_APPLY_TYPE => "QUEST" , :GROUP_ID => @next_quest_info.GROUP_ID)
  
      @next_quest_instance.save
      
      add_result(result, "NEW_QUEST_INSTANCE", @next_quest_instance)
    
    end

    add_result(result, "INSTANCE", @quest_instance)

    respond_to do |format|
      format.html
      format.json { render json: result }
    end

  end

  #-------------------------------------------------------------------------------------
  def set_quest
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user." + params[:user_no], 100000)
    end

    # 인스턴스 목록 -> 리턴할 값
    result = Hash.new
    
    get_character_list(result, @user)
    @character_hash = result[ result.length - 1 ]["RESULT_VALUE"]
    if @character_hash == nil
      return error("not find character_instnace_list in hash", 0)
    end
      
    get_stage(result, @user, @character_hash)
    @stage_clear_hash = result[ result.length - 1 ]["RESULT_VALUE"]
    if @stage_clear_hash == nil
      return error("not find @stage_clear in hash", 0)
    end  
      
    instance_quest_hash = get_quest(result, @user, @stage_clear_hash)

    respond_to do |format|
      format.html
      format.json { render json: instance_quest_hash }
    end

  end
  
   def update_quest
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user." + params[:user_no], 100000)
    end

    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not find character." + params[:character_no], 100019)
    end
     
    result = Hash.new
    count = params[:COUNT]

    for n in 0..count.to_i-1
      at = "PARAMS_" + n.to_s
      quest_instance = params[at]

      @quest_instance = QuestInstance.where(:QUEST_NO => quest_instance[:QUEST_NO]).first

      if @quest_instance == nil
        notice = "not found @quest_instance "
        notice  << quest_instance[:QUEST_NO]
        return error(notice, 120001)
      end

      @quest_info = QuestInfo.where(:QUEST_INFO_ID => quest_instance[:QUEST_INFO_ID]).first
      if @quest_info == nil
        return error("not found quest_info", 120001)
      end

      @quest_instance.QUEST_VALUE = quest_instance[:QUEST_VALUE]
      
      if @quest_instance.QUEST_VALUE.to_i >= @quest_info.MAXVALUE.to_i
        if @quest_instance.CLEAR != "CLEAR_ABLE" 
          log_to_db("QUEST_CLEAR", @quest_instance.to_json, @user, @character)
          
          if @quest_instance.QUEST_INFO_ID == 20005 || @quest_instance.QUEST_INFO_ID == 20011
            log_to_db("DAILY_QUEST_CLEAR", @quest_instance.to_json, @user, @character)  
          end  
          
        end
        @quest_instance.CLEAR = "CLEAR_ABLE"
      end

      @quest_instance.save
    end

    message("update quest success", 0)
  end

end