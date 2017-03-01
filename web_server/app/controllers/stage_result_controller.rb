class StageResultController < ApplicationController
  before_action :auth_check
  
  def result
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. " + params[:user_no], 100000)
    end
    
    @stage_instances = StageInstance.where(:CHARACTER_NO => params[:character_no], :STAGE_ID => params[:stage_id]).first
    if @stage_instances == nil
       return error("not find stage_instances" + params[:character_no], 100052)
    end
    
     
    @StageInfo = StageInfo.where(:STAGE_ID => params[:stage_id]).first     
    if @StageInfo == nil
      return error("not find stage_info" + params[:user_no], 100053)
    end

    @character = CharacterInstance.where(:CHARACTER_NO => @stage_instances.CHARACTER_NO).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
     
    clear_score = @StageInfo.CLEAR_SCORE.split("|")
     
    if params[:score].to_i < clear_score[2].to_i
      grade = 2
    elsif params[:score].to_i < clear_score[1].to_i
      grade = 1
    else
      grade = 0
    end

    debug_logger(grade)
    
    clear_exp = @stage_instances.CLEAR_EXP_NO.split("|")[grade]
    clear_money = @stage_instances.CLEAR_MONEY_NO.split("|")[grade]
    clear_reward = @stage_instances.CLEAR_REWARD_NO.split("|")[grade]
            
    result = Hash.new

    add_result(result, "REWARD", clear_reward)

    if clear_reward.to_s != "NONE"
      log_to_db("STAGE_REWARD", @stage_instances.as_json.merge("CLEAR_GRADE" => grade).merge("CLEAR_REWARD" => clear_reward).to_json, @user, @character)
      reward_group = clear_reward.split(",")
  
      for n in 0...reward_group.length
        reward = reward_group[n]
        reward_type, reward_value, argument = reward_parsing(reward, @character)
        if add_item(result, @user, reward_type, reward_value, argument) == false
          return
        end
      end
    end 
    
    @user.MONEY = @user.MONEY + clear_money.to_i
    
    add_result(result, "GOLD", clear_money.to_i)
    
    if add_item(result, @user, "EXP", clear_exp.to_i, @character) == false
      return
    end
    
    pre_score_for_infinity_tower_mode = 0
            
    @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @stage_clear_instance == nil
      # { 없을 경우 새로 만드는 케이스
       
      stage_id = @stage_instances.STAGE_ID
      if stage_id == -1
        stage_id = 1
      end
       
      @stage_clear_instance = StageClearInstance.new(:USER_NO => params[:user_no],
       :CLEAR_STAGE => stage_id, :STAGE_SCORE => params[:score], :LAST_DATE => Time.now)
      @stage_clear_instance.save

      result[result.length] = @stage_clear_instance.as_json.merge("RESULT_TYPE" => "STAGE_CLEAR_INSTANCE")
      # }
    elsif
      # { 있어서 추가 / 변경 하는 케이스
      clear_stage = @stage_clear_instance.CLEAR_STAGE.split("|")
      clear_score = @stage_clear_instance.STAGE_SCORE.split("|")
      
      score = params[:score]
      
      stage_id = @stage_instances.STAGE_ID
      if stage_id == -1
        stage_id = 1
      end
      
      index = clear_stage.index(stage_id.to_s)
      if index != nil
        
        pre_score_for_infinity_tower_mode = clear_score[index].to_i
                
        if clear_score[index].to_i > score.to_i
           clear_score[index] = score.to_s
           debug_logger("change score")
        end
        
      elsif
        clear_stage << stage_id.to_s
        clear_score << score.to_s
      end
      
      stage_string = ""
      score_string = ""
      
      for n in 0...clear_stage.length
        if n != 0
          stage_string << "|"
        end
        stage_string << clear_stage[n]
      end # for 관련 end

      for n in 0...clear_score.length
        if n != 0
          score_string << "|"
        end
        score_string << clear_score[n]
      end # for 관련 end

      @stage_clear_instance.CLEAR_STAGE = stage_string
      @stage_clear_instance.STAGE_SCORE = score_string
      
      @stage_clear_instance.save
      
      @stage_instances.destroy
      # }
      
      result[result.length] = @stage_clear_instance.as_json.merge("RESULT_TYPE" => "STAGE_CLEAR_INSTANCE")
    end  # stage clear == nil if 문 end    

    if params[:is_infi_tower].to_i == 1
      reward_infi_tower(pre_score_for_infinity_tower_mode, params[:score], params[:character_no], params[:stage_id])
      
      
      stage_num = @StageInfo.STAGE_NUMBER.to_i  
      debug_logger(stage_num)
      if @user.INFI_TOWER_FLOOR < stage_num
        @user.INFI_TOWER_FLOOR = stage_num
        @user.save
      end
      
    end

    @stage_instances.destroy

    log_to_db("STAGE_CLEAR", @stage_instances.to_json, @user, @character)

    respond_to do |format|
      format.html 
      format.json { render json: result }
    end    
  end # def end
  
  def continue
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. " + params.to_a.to_s, 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:user_no], 100019)
    end
    
    check = false
    
    if @user.CASH >= params[:cash].to_i
       @user.CASH -= params[:cash].to_i
       check = true
    end
    
    result = Hash.new

    hash = Hash.new
    hash["RESULT_TYPE"] = "result_check"
    hash["RESULT_VALUE"] = check
    result[result.length] = hash
      
    @user.save
    
    log_to_db("STAGE_CONTINUE", @stage_instances.to_json, @user, @character)
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end    
  end
  
  def reward_infi_tower(pre_score, cur_score, character_no, stage_id) 
                
    @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => character_no).first
    if @stage_clear_instance == nil
      return error("not find item" + character_no, 100051)
    end
     
    @stage_info = StageInfo.where(:STAGE_ID => stage_id).first
    if @stage_info == nil
      return error("not found stage info" + stage_id, 0)
    end
  
    clear_scores = @stage_info.CLEAR_SCORE.split("|")
    if clear_scores.length != 3
      return error("클리어 스코어가 잘못 작성 되어있습니다. STAGE_INFO ID: " + stage_id)
    end
    
    pre_grade = 0
    cur_grade = 0 
    
    if pre_score.to_i < clear_scores[2].to_i
      pre_grade = 3
    elsif pre_score.to_i < clear_scores[1].to_i
      pre_grade = 2
    else
      pre_grade = 1
    end
    
    if pre_score.to_i == 0
      pre_grade = 0
    end 
    
    if cur_score.to_i < clear_scores[2].to_i
      cur_grade = 3
    elsif cur_score.to_i < clear_scores[1].to_i
      cur_grade = 2
    else
      cur_grade = 1
    end
                  
    if cur_grade - pre_grade > 0 
      #GM 김성렬 번호
      gm_no = 2
    
      #메일 보관기간(일수)
      keep_date = 3
    
      result_reward = cur_grade - pre_grade   
      stage_rewards = @stage_info.INFI_TOWER_SP_REWARD.split("|")  
       
      for n in 0...result_reward 
        i = cur_grade - 1 - n   
        reward_str = stage_rewards[i].to_s
        clear_floor = @stage_info.NAME + " 보상"
        mail_type = "INFINITY"
        send_to_mail(@stage_clear_instance.USER_NO, gm_no, "무한의 탑 보상",clear_floor, reward_str, "icon", Time.now + (60 * 60 * 24 * keep_date), mail_type)  
        debug_logger(reward_str)
      end
          
    end
            
  end 
  
end # last end
