class MonsterEvolutionController < ApplicationController
  def evolution
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not exist user_id " + params[:user_no], 100000)
    end
    
    type = params[:type]
    monster_no = params[:monster_no]
    slave_no = params[:slave_monster_no]
    
    #타입별 예외 처리 추가
    
    @master_monster_instance = MonsterInstance.where(:USER_NO => params[:user_no], :MONSTER_NO => params[:monster_no]).first
    if @master_monster_instance == nil
      return error("not find monster_instances. " + params[:user_no] + " monster_no:" +  params[:monster_no], 100040)
    end
    
    @monster_infos = MonsterInfo.where(:MONSTER_ID => @master_monster_instance.MONSTER_ID).first
    if @monster_infos == nil
          return error("not find monster_info : ".  + params[:user_no] + " monster_instances:" + @master_monster_instance.to_s, 100041)
    end

    @actor_status_script = ActorStatusScript.where(:index => @monster_infos.ACTOR_ID).first
    if @actor_status_script == nil
      return error("invalid character_info: " + @character_info.ACTOR_ID.to_s, 100018)
    end

    result = Hash.new

    @evolution_infos = EvolutionInfo.where(:GRADE => @monster_infos.MONSTER_GRADE)
    
    evolution_info = nil
    @evolution_infos.each do |x| 
      debug_logger(x.EVOLUTION_ID)
      
      if x.EVOLUTION_EVENT_TYPE == "EVENT"
        now_time = Time.now.utc
        
        if x.START_DATE_TIME.to_datetime.utc < now_time && x.END_DATE_TIME.to_datetime.utc > now_time
          if evolution_info == nil
            evolution_info = x
          else
            if evolution_info.START_DATE_TIME.utc < x.Value.START_DATE_TIME.utc
              evolution_info = x
            end
          end
        end
      else
        if evolution_info == nil
          evolution_info = x
        end
      end 
    end

    # 재료 요괴가 부족한 경우
    if type == "FIX"
      count = params[:COUNT]
      if(count.to_i < 1)
        return error("not enough monster info.RAW : " + evolution_info.RAW.to_s, 100084) # 번호 변경
      end
    elsif type == "RANDOM"
      count = params[:COUNT]
      if(count.to_i < evolution_info.RAW)
        return error("not enough monster info.RAW : " + evolution_info.RAW.to_s, 100084) # 번호 변경
      end
    end

    plus_percent = 0
      
    if evolution_info.EVOLUTION_EVENT_TYPE == "EVENT"
      plus_percent = evolution_info.PERCENT_UP
    end

    if type == "FIX"
      @actor_status_by_group = ActorStatusScript.where(:actor_group_id => @actor_status_script.actor_group_id)
      sorted_group = @actor_status_by_group.sort  { |x, y| x.group_rank_id <=> y.group_rank_id }

      debug_logger("소트 그룹 카운트") 
      debug_logger(sorted_group.count)
      
      next_actor = sorted_group[@actor_status_script.group_rank_id]
      
      debug_logger("엑터 인덱스") 
      debug_logger(next_actor.index)
       
       
      monster_infos = MonsterInfo.where(:ACTOR_ID => next_actor.index).first
      if monster_infos == nil
        return error("not find monster_info : ".  + params[:user_no] + " monster_instances:" + monster_infos.to_s, 100041)
      end
      debug_logger("몬스터 아이디")
      debug_logger(monster_infos.MONSTER_ID)
      
      @monster_instance = MonsterInstance.new(:MONSTER_NO => sequence("monster_instances"),:USER_NO => params[:user_no], :CHARACTER_NO => -10,
        :MONSTER_ID => monster_infos.MONSTER_ID,:GROW_TYPE_DETAIL => monster_infos.GROW_TYPE_DETAIL, :LEVEL => 1, :EXP => 0, :SKILL => get_monster_special_skill(monster_infos.MONSTER_ID,plus_percent), :TEAM_SLOT => 0, :NEW => 1)
      @monster_instance.save
      
      add_result(result, "MONSTER", @monster_instance)
      
      @monster_instance = MonsterInstance.new(:MONSTER_NO => sequence("monster_instances"),:USER_NO => params[:user_no], :CHARACTER_NO => -10,
        :MONSTER_ID => monster_infos.MONSTER_ID,:GROW_TYPE_DETAIL => monster_infos.GROW_TYPE_DETAIL, :LEVEL => 1, :EXP => 0, :SKILL => get_monster_special_skill(monster_infos.MONSTER_ID,plus_percent), :TEAM_SLOT => 0, :NEW => 1)
      @monster_instance.save
      
      add_result(result, "MONSTER", @monster_instance)
      
    elsif type == "RANDOM"
      for n in 0...2
        result_list = evolution_info.RESULT.split('|');
        result_percent = evolution_info.RESULT_PERCENT.split('|');
        
        random_for_gacha = rand(0.0...100.0)
        sum = 0
        for n in 0...result_percent.length
          sum += result_percent[n].to_f 
          if random_for_gacha < sum
            gacha_group_id = result_list[n]
            break
          end
        end
    
        @gacha_group = GachaGroup.where(:GACHA_GROUP_ID => gacha_group_id).first 
        if @gacha_group == nil
          return error("not found group id : " + gacha_group_id.to_s, 100009)
        end
          
        group_rewards = @gacha_group.GROUP_REWARD.split("|")
          
        random_for_reward = rand(0...group_rewards.length)
        reward = group_rewards[random_for_reward] 
  
        debug_logger(reward)
          
        reward_monster_id = reward.split("_")[1]
          
        monster_infos = MonsterInfo.where(:MONSTER_ID => reward_monster_id).first
        if monster_infos == nil
          return error("not find monster_info : ".  + params[:user_no] + " monster_instances:" + monster_infos.to_s, 100041)
        end
    
        @monster_instance = MonsterInstance.new(:MONSTER_NO => sequence("monster_instances"),:USER_NO => params[:user_no], :CHARACTER_NO => -10,
           :MONSTER_ID => monster_infos.MONSTER_ID,:GROW_TYPE_DETAIL => monster_infos.GROW_TYPE_DETAIL, :LEVEL => 1, :EXP => 0, :SKILL => get_monster_special_skill(monster_infos.MONSTER_ID,plus_percent), :TEAM_SLOT => 0, :NEW => 1)
        @monster_instance.save
          
        add_result(result, "MONSTER", @monster_instance)
      end   
    end

    @master_monster_instance.destroy
    
    for n in 0..count.to_i-1
      at = "PARAMS_" + n.to_s
      monster_instance = params[at]
      @monster_instance = MonsterInstance.where(:USER_NO => params[:user_no], :MONSTER_NO => monster_instance[:MONSTER_NO]).first
      if @monster_instance == nil
        return error("not find monster_instances. " + params[:user_no] + " monster_no:" +  monster_instance[:MONSTER_NO], 100040)
      end
      @monster_instance.destroy
    end

    @user.MONEY -= evolution_info.PRICE_COIN
    @user.save
    
    add_result(result, "USER", @user)
  
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end

  def evolution_confirm
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not exist user_id " + params[:user_no], 100000)
    end
    
    @monster_instance = MonsterInstance.where(:USER_NO => params[:user_no], :MONSTER_NO => params[:monster_no]).first
    if @monster_instance == nil
      return error("not find monster_instances. " + params[:user_no] + " monster_no:" +  params[:monster_no], 100040)
    end
      
    ############################################################
    if params[:re_evolution] == "True"
      ############################################################
      @monster_infos = MonsterInfo.where(:MONSTER_ID => @monster_instance.MONSTER_ID).first
      if @monster_infos == nil
         return error("not find monster_info : ".  + params[:user_no] + " monster_instances:" + @monster_instance.to_s, 100041)
      end
      
      @evolution_infos = EvolutionInfo.where(:GRADE => @monster_infos.MONSTER_GRADE - 1)
      evolution_info = nil
      @evolution_infos.each do |x|  
        debug_logger(x.EVOLUTION_ID)
          
        if x.EVOLUTION_EVENT_TYPE == "EVENT"
          now_time = Time.now
            
          if x.START_DATE_TIME.to_datetime < now_time && x.END_DATE_TIME.to_datetime > now_time
            if evolution_info == nil
              evolution_info = x
            else
              if evolution_info.START_DATE_TIME < x.Value.START_DATE_TIME
                evolution_info = x
              end
            end
          end
        else
          if evolution_info == nil
            evolution_info = x
          end
        end 
      end
          
      if @user.CASH < evolution_info.PRICE_DIAMOND
        return error("not enough money : " + @user.CASH.to_s, 100017)
      end
      debug_logger(evolution_info.PRICE_DIAMOND.to_s)
      
      @user.CASH -= evolution_info.PRICE_DIAMOND
      @user.save
      
      @evolution_monster_instance = MonsterInstance.where(:USER_NO => params[:user_no], :CHARACTER_NO => -10)
      if @evolution_monster_instance == nil
        return error("not find monster_instances. " + params[:user_no] + " monster_no:" +  params[:monster_no], 100040)
      end  
      
      @evolution_monster_instance.each do |x|   
        x.CHARACTER_NO = -20
        x.save
      end
      
      log_to_db("MONSTER_RE_EVOLUTION", @evolution_monster_instance.to_json, @user, @character)
      
      result = Hash.new
      add_result(result, "USER", @user)
      ############################################################
    else
      ############################################################
      debug_logger(@monster_instance.MONSTER_NO)
      debug_logger("진화 성공")
      @monster_instance.CHARACTER_NO = 0;
      @monster_instance.save
      
      @user.CACHE_MONSTER_SLOT += 1
      @user.save
      
      @delete_monster_instance = MonsterInstance.where(:USER_NO => params[:user_no], :CHARACTER_NO => -20)
      if @delete_monster_instance == nil
        return error("not find monster_instances. " + params[:user_no] + " monster_no:" +  params[:monster_no], 100040)
      end  
      
      @delete_monster_instance.each do |x|   
        x.destroy
      end
      
      @delete_monster_instance = MonsterInstance.where(:USER_NO => params[:user_no], :CHARACTER_NO => -10)
      if @delete_monster_instance == nil
        return error("not find monster_instances. " + params[:user_no] + " monster_no:" +  params[:monster_no], 100040)
      end  
      
      @delete_monster_instance.each do |x|   
        x.destroy
      end
     
      result = Hash.new
    
      add_result(result, "MONSTER", @monster_instance)
      add_result(result, "USER", @user)
      
      log_to_db("MONSTER_EVOLUTION", @monster_instance.to_json, @user, @character)
      ############################################################
    end
    ############################################################
      respond_to do |format|
        format.html 
        format.json { render json: result }
      end    
  end

end
