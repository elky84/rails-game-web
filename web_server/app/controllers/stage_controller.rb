class StageController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname]
  before_action :ip_check, only: [:find_by_nickname]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])

    @character = CharacterInstance.where(:USER_NO => user_no, :CHARACTER_ID => params[:character_id]).first
    if @character == nil
      return error("not find character" + params[:character_id], 100019)
    end

    @stage_instances = StageInstance.where(:CHARACTER_NO => @character.CHARACTER_NO)

    respond_to do |format|
      format.html 
      format.json { render json: @stage_instances }
    end
  end
  
  def all
    @stage_instances = StageInstance.where(:CHARACTER_NO => params[:character_no])
     
    respond_to do |format|
      format.html 
      format.json { render json: @stage_instances }
    end
  end

  def get
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not exist user_no " + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not exist character_no " + params[:character_no], 100000)
    end
    
    @stage_instances = StageInstance.where(:CHARACTER_NO => params[:character_no])
    if @stage_instances != nil
      @stage_instances.each do | stage |
        log_to_db("STAGE_INSTANCE_DESTROY", @stage_instances.to_json, @user, @character)
        stage.destroy
      end
    end

    @stage_info = StageInfo.where(:STAGE_ID => params[:STAGE_ID]).first
    if @stage_info == nil
      return error("not find stage_info " + params[:user_no], 100053)
    end

    @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @stage_clear_instance == nil
      return error("not find item " + params[:user_no], 100051)
    end

    #-------------------------------------------------------------------------------------------------
    # 여기부터 추가 부분 보유량 체크
    check = check_more_than_max_value(@user)
    
    if check == false
      return error("max value", 100051)
    end
    
    #-------------------------------------------------------------------------------------------------
    
    #유저인스턴스에 스태미너 검증로직을 한번 거친다. 
    @user = stamina_check(@user)
        
    if check == true
      arr_stamina = @stage_info.STAMINA.split("_")
      stamina_type = arr_stamina[0]
      need_stamina = arr_stamina[1].to_i
      
      if stamina_type == "PVP"  #사실 대전 포인트는 pvp_controller.nomercy 에서 차감합니다.
        if @user.STAMINA_PVP < need_stamina
          return error("not enough stamina " + params[:user_no] + " stage_info: " + @stage_info.to_s, 100054)
        end
        
        if @user.STAMINA_PVP == 5
          @user.STAMINA_PVP_TIME = Time.now            
        end
        
        @user.STAMINA_PVP -= need_stamina
        
      elsif stamina_type == "ADVENTURE"
        if @user.STAMINA_ADVENTURE < need_stamina
          return error("not enough stamina " + params[:user_no] + " stage_info: " + @stage_info.to_s, 100054)
        end
        
        if @user.STAMINA_ADVENTURE == 5
          @user.STAMINA_ADVENTURE_TIME = Time.now
        end
        
        @user.STAMINA_ADVENTURE -= need_stamina
        
      elsif stamina_type == "SPECIAL"
        if @user.STAMINA_SPECIAL < need_stamina
          return error("not enough stamina " + params[:user_no] + " stage_info: " + @stage_info.to_s, 100054)
        end
        
        if @user.STAMINA_SPECIAL == 5
          @user.STAMINA_SPECIAL_TIME = Time.now
        end
        
        @user.STAMINA_SPECIAL -= need_stamina

      end
      
      @user.save
      
      @user_ori = @user
      
      if params[:friend_user_no] != "0"
        @list1 = FriendInstance.where(:USER_NO => params[:user_no])
        @friend1 =  @list1.where(:FRIEND_USER_NO => params[:friend_user_no]).first
        
        @list2 = FriendInstance.where(:FRIEND_USER_NO => params[:user_no])
        @friend2 = @list2.where(:USER_NO => params[:friend_user_no]).first

        if @friend1 == nil && @friend2 == nil 
          return error("can`t find friend. USER_NO:" + params[:user_no] + "Friend User no :" +  params[:friend_user_no] , 100100)
        end
        
        if @friend1 != nil
          if @friend1.USER_ADV_TOGETHER_DATE > Time.now - 1.days   
            return message("time is`t pass 24hour . USER_NO:" + params[:user_no] + "Friend User no :" +  params[:friend_user_no] , 100101)
          end
          @friend1.USER_ADV_TOGETHER_DATE = Time.now
          @friend1.save
        elsif @friend2 != nil
          if @friend2.FRIEND_USER_ADV_TOGETHER_DATE > Time.now - 1.days
            return message("time is`t pass 24hour . USER_NO:" + params[:user_no] + "Friend User no :" +  params[:friend_user_no] , 100101)
          end
          @friend2.FRIEND_USER_ADV_TOGETHER_DATE = Time.now
          @friend2.save
        end
        
        
        
        target_no = params[:friend_user_no]
        sender_no = params[:user_no]
        reward = "FP_2"
        title = "친구 보상"
        content = "친구 보상입니다."
        icon = "icon"
        end_date = Time.now + (60 * 60 * 24 * 3)
        if false == send_to_mail(target_no,sender_no,title,content,reward,icon,end_date , "TOGETHER")
          return error("can`t send mail. USER_NO:" + params[:user_no] , 100062)
        end
      end
  
      @stage_instances = StageInstance.new( :STAGE_PROGRESS_NO => sequence("stage_instances"), :USER_NO => params[:USER_NO], :CHARACTER_NO => params[:character_no], :PARTY_MONSTER_ID => params[:PARTY_MONSTER_ID], :STAGE_ID => params[:STAGE_ID],
        :CLEAR_EXP_NO => params[:CLEAR_EXP_NO], :CLEAR_MONEY_NO => params[:CLEAR_MONEY_NO], :CLEAR_REWARD_NO => params[:CLEAR_REWARD_NO], :START_DATE => Time.now)
      
      @stage_instances.save
  
      play_stage = @stage_clear_instance.PLAY_STAGE.split("|")
    
      stage_id = params[:stage_id]
      if nil == @stage_clear_instance.PLAY_STAGE.index(stage_id.to_s) # 없어야 생성
        play_stage << stage_id.to_s
        stage_string = ""
        
        for n in 0...stage_id.length
          if n != 0
            stage_string << "|"
          end
          stage_string << stage_id[n]
        end # for 관련 end
    
        @stage_clear_instance.PLAY_STAGE = stage_string
        
        @stage_clear_instance.save
      end
    end

    result = Hash.new        
    
    add_result(result, "CHECK", check)
    add_result(result, "USER", @user_ori)
          
    log_to_db("STAGE_ENTER", @stage_instances.to_json, @user, @character)
          
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end

  def stamina_use(stamina, need_stamina)
    if stamina < need_stamina
      return false 
    end

    stamina = stamina - need_stamina
    return true
  end
        
  def save
    @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @stage_clear_instance == nil
      return error("not find item " + params[:user_no], 100051)
    end

    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not exist user_no " + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not exist character_no " + params[:character_no], 100000)
    end

    @stage_info = StageInfo.where(:STAGE_ID => params[:STAGE_ID]).first
    if @stage_info == nil
      return error("not find stage_info " + params[:user_no], 100053)
    end
    
    #-------------------------------------------------------------------------------------------------
    # 여기부터 추가 부분 보유량 체크

    check = check_more_than_max_value(@user)

    #-------------------------------------------------------------------------------------------------
    if check == true
      arr_stamina = @stage_info.STAMINA.split("_")
      stamina_type = arr_stamina[0]
      need_stamina = arr_stamina[1].to_i
      
      if stamina_type == "PVP"  #사실 대전 포인트는 pvp_controller.nomercy 에서 차감합니다.
        if @user.STAMINA_PVP < need_stamina
          return error("not enough stamina " + params[:user_no] + " stage_info: " + @stage_info.to_s, 100054)
        end
        
        if @user.STAMINA_PVP == 5
          @user.STAMINA_PVP_TIME = Time.now            
        end
        
        @user.STAMINA_PVP -= need_stamina
        
      elsif stamina_type == "ADVENTURE"
        if @user.STAMINA_ADVENTURE < need_stamina
          return error("not enough stamina " + params[:user_no] + " stage_info: " + @stage_info.to_s, 100054)
        end
        
        if @user.STAMINA_ADVENTURE == 5
          @user.STAMINA_ADVENTURE_TIME = Time.now
        end
        
        @user.STAMINA_ADVENTURE -= need_stamina
        
      elsif stamina_type == "SPECIAL"
        if @user.STAMINA_SPECIAL < need_stamina
          return error("not enough stamina " + params[:user_no] + " stage_info: " + @stage_info.to_s, 100054)
        end
        
        if @user.STAMINA_SPECIAL == 5
          @user.STAMINA_SPECIAL_TIME = Time.now
        end
        
        @user.STAMINA_SPECIAL -= need_stamina

      end
      
      @user.save
      
      @user_ori = @user
      
      if params[:friend_user_no] != "0"
        @list1 = FriendInstance.where(:USER_NO => params[:user_no])
        @friend1 =  @list1.where(:FRIEND_USER_NO => params[:friend_user_no]).first
        
        @list2 = FriendInstance.where(:FRIEND_USER_NO => params[:user_no])
        @friend2 = @list2.where(:USER_NO => params[:friend_user_no]).first

        if @friend1 == nil && @friend2 == nil 
          return error("can`t find friend. USER_NO:" + params[:user_no] + "Friend User no :" +  params[:friend_user_no] , 100100)
        end
        
        if @friend1 != nil
          if @friend1.USER_ADV_TOGETHER_DATE > Time.now - 1.days   
            return error("time is`t pass 24hour . USER_NO:" + params[:user_no] + "Friend User no :" +  params[:friend_user_no] , 100101)
          end
          @friend1.USER_ADV_TOGETHER_DATE = Time.now
          @friend1.save
        elsif @friend2 != nil
          if @friend2.FRIEND_USER_ADV_TOGETHER_DATE > Time.now - 1.days
            return error("time is`t pass 24hour . USER_NO:" + params[:user_no] + "Friend User no :" +  params[:friend_user_no] , 100101)
          end
          @friend2.FRIEND_USER_ADV_TOGETHER_DATE = Time.now
          @friend2.save
        end
        
        target_no = params[:friend_user_no]
        sender_no = params[:user_no]
        reward = "FP_2"
        title = "친구 보상"
        content = "친구 보상입니다."
        icon = "icon"
        end_date = Time.now + (60 * 60 * 24 * 3)
        
        log_to_db("SUMMON_FRIEND", @stage_instances.to_json, @user, @character)
        
        if false == send_to_mail(target_no,sender_no,title,content,reward,icon,end_date , "TOGETHER")
          return error("can`t send mail. USER_NO:" + params[:user_no] , 100062)
        end
      end
  
      play_stage = @stage_clear_instance.PLAY_STAGE.split("|")
    
      stage_id = params[:stage_id]
      if nil == @stage_clear_instance.PLAY_STAGE.index(stage_id.to_s) # 없어야 생성
        play_stage << stage_id.to_s
        stage_string = ""
        
        for n in 0...stage_id.length
          if n != 0
            stage_string << "|"
          end
          stage_string << stage_id[n]
        end # for 관련 end
    
        @stage_clear_instance.PLAY_STAGE = stage_string
        
        @stage_clear_instance.save
      end
     
      @stage_instances = StageInstance.new( :STAGE_PROGRESS_NO => sequence("stage_instances"), :USER_NO => params[:USER_NO], :CHARACTER_NO => params[:character_no], :PARTY_MONSTER_ID => params[:PARTY_MONSTER_ID], :STAGE_ID => params[:STAGE_ID],
      :CLEAR_EXP_NO => params[:CLEAR_EXP_NO], :CLEAR_MONEY_NO => params[:CLEAR_MONEY_NO], :CLEAR_REWARD_NO => params[:CLEAR_REWARD_NO], :START_DATE => Time.now)
      
      @stage_instances.save
    end

    result = Hash.new        
    
    add_result(result, "CHECK", check)
    add_result(result, "USER", @user_ori)
          
    log_to_db("STAGE_ENTER", @stage_instances.to_json, @user, @character)
          
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end

  def destroy
    @stage_instances = StageInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @stage_instances == nil
      return error("not find item " + params[:user_no], 100052)
    end

    @stage_instances.destroy
    message("update success", 0)
  end
end
