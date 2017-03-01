class MonsterController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname]
  before_action :ip_check, only: [:find_by_nickname]

  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @monster_instances = MonsterInstance.where(:USER_NO => user_no)

    respond_to do |format|
      format.html 
      format.json { render json: @monster_instances }
    end
  end
  
  def all
    @monster_instances = MonsterInstance.where(:USER_NO => params[:user_no])
     
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not exist user_id " + params[:user_no], 100000)
    end
    
    @user.CACHE_MONSTER_SLOT = @monster_instances.count 
    @user.save
    
    result = Hash.new

    add_result(result, "USER", @user)

    @monster_instances.each  do |monster|
      add_result(result, "MONSTER", monster)
    end
      
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end
  
  def get
     @monster_instances = MonsterInstance.where(:MONSTER_NO=> params[:monster_no]).first    
     if @monster_instances == nil
        return error("not find monster no : " + params[:monster_no], 100040)
     end
     
     respond_to do |format|
       format.html 
       format.json { render json: @monster_instances }
     end    
  end
  
  def save
    count = params[:COUNT]
    
    @character_instance = CharacterInstance.where(:USER_NO => params[:user_no] , :CHARACTER_NO =>params[:char_no]).first
    if @character_instance == nil
        return error("not find character " + params[:user_no], 100019)
    end

    for n in 0..count.to_i-1
      at = "PARAMS_" + n.to_s
      item = params[at]
      
      @monster_instances = MonsterInstance.where(:MONSTER_NO => item[:MONSTER_NO]).first
      
      # ------------------------------------------------------------
      # 이부분 수정이 들어가야 한다 
      if @monster_instances == nil
        return error("not find item" + params[:user_no], 100040)
      end
     
      @monster_instances.NEW = item[:NEW]
      @monster_instances.CHARACTER_NO = item[:CHARACTER_NO]
      @monster_instances.TEAM_SLOT = item[:TEAM_SLOT]
  
      @monster_instances.save
    end    

    @character_instance.PARTY_MONSTER_ID = params[:party_no]
    @character_instance.save

    message("update success", 0)
  end

  def destroy
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. " + params[:user_no], 100000)
    end

    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end    
    @monster_instance = MonsterInstance.where(:USER_NO => params[:user_no], :MONSTER_NO => params[:monster_no]).first
    if @monster_instance == nil
      return error("not find monster_instances. " + params[:user_no] + " monster_no:" +  params[:monster_no], 100040)
    end
    
    @monster_infos = MonsterInfo.where(:MONSTER_ID => @monster_instance.MONSTER_ID).first
    if @monster_infos == nil
          return error("not find monster_info : ".  + params[:user_no] + " monster_instances:" + @monster_instance.to_s, 100041)
    end
    
    result = Hash.new      
    
    add_item(result, @user, "GOLD", @monster_infos.MONSTER_PRICE, nil)
    @user.CACHE_MONSTER_SLOT -= 1;
    @user.save
    
    hash = Hash.new
    hash["RESULT_TYPE"] = "SELL_MONSTER"
    hash["RESULT_VALUE"] = @monster_instance
    result[result.length] = hash

    log_to_db("MONSTER_SELL", @monster_instance.to_json, @user, @character)            
            
    @monster_instance.destroy
        
    respond_to do |format|
       format.html 
       format.json { render json: result }
    end
    

  end
  
  def enchant
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. " + params[:user_no], 100000)
    end

    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
  
    @monster_instance = MonsterInstance.where(:MONSTER_NO => params[:MONSTER_NO]).first
    if @monster_instance == nil
      return error("not find monster_instances. " + params[:user_no] + " monster_no:" +  params[:MONSTER_NO], 100040)
    end
    
    cost = 0
    count = params[:count]
    for param_index in 1..count.to_i
      monster_no = params["monster_no"+param_index.to_s]
      @material_monster = MonsterInstance.where(:MONSTER_NO => monster_no).first
      if @material_monster == nil
        return error("not find monster. monster_no:" + monster_no, 100040)
      end
      
      @monster_info = MonsterInfo.where(:MONSTER_ID => @material_monster.MONSTER_ID).first
      if @monster_info == nil
        return error("not find monster_info. monster_id:" + @material_monster.MONSTER_ID, 100041)
      end
      
       @monster_enchant = MonsterEnchant.where(:MONSTER_GRADE => @monster_info.MONSTER_GRADE).first
      if @monster_enchant == nil
        return error("not find @material_monster. monster_id:" + @material_monster.MONSTER_ID + " monster_grade:" + @monster_info.MONSTER_GRADE, 100050)
      end
      
    # 비용 가산
      cost = (@monster_enchant.BASE_MONEY + (@monster_enchant.LEVEL_MONEY * @material_monster.LEVEL))
    end
        
    result = Hash.new
    reward_plus_exp = 0
        
    enough_money = true
    
    if(@user.MONEY < cost)
      enough_money = false
                  
      hash = Hash.new
      hash["RESULT_TYPE"] = "ERROR"
      hash["RESULT_VALUE"] = enough_money
      result[result.length] = hash
    end
    
    if enough_money == true
      skill_arr = @monster_instance.SKILL.split("|")
      
      arr = Array.new()
      
      for n in 0 ... skill_arr.count
        @skill_script = SkillScript.where(:SKILL_ID => skill_arr[n]).first
        skill_by_group = SkillScript.where(:SKILL_GROUP_ID => @skill_script.SKILL_GROUP_ID)
        sorted_group = skill_by_group.sort  { |x, y| x.SKILL_ID <=> y.SKILL_ID }
  
        if(sorted_group[skill_by_group.count-1].SKILL_ID.to_i > @skill_script.SKILL_ID.to_i)
          arr << @skill_script
        end
        
      end
      
      max_enchant = false
      
      if(arr.count <= 0)
        max_enchant = true
      end      
    
      if(max_enchant == false)            
        random_for_skill_no = rand(0...arr.count)
        skill_id = arr[random_for_skill_no].SKILL_ID
        
        @skill_script = SkillScript.where(:SKILL_ID => skill_id).first
        if @skill_script == nil
          return error("not find skill_script. skill_id:" + skill_id, 100049)
        end
      end
      
      count = params[:count]
      result_index = -1
  
      for param_index in 1..count.to_i
        monster_no = params["monster_no"+param_index.to_s]
        @material_monster = MonsterInstance.where(:MONSTER_NO => monster_no).first
        if @material_monster == nil
          return error("not find monster. monster_no:" + monster_no, 100040)
        end
        
        @monster_info = MonsterInfo.where(:MONSTER_ID => @material_monster.MONSTER_ID).first
        if @monster_info == nil
          return error("not find monster_info. monster_id:" + @material_monster.MONSTER_ID, 100041)
        end
        
         @monster_enchant = MonsterEnchant.where(:MONSTER_GRADE => @monster_info.MONSTER_GRADE).first
        if @monster_enchant == nil
          return error("not find @material_monster. monster_id:" + @material_monster.MONSTER_ID + " monster_grade:" + @monster_info.MONSTER_GRADE, 100050)
        end
        
        if result_index < 0
          
          #random_for_percent = rand(0..100)
          sum = 0.0
          percent = 0.0
               
          enchant_result = @monster_enchant.ENCHANT_RESULT.split("|")
          total_value_for_percent = 0.0
          
          for at in 0...enchant_result.length
            total_value_for_percent += enchant_result[at].to_f
          end
          
          random_for_percent = rand(0..total_value_for_percent)
          
          for at in 0...enchant_result.length
              sum += enchant_result[at].to_f    
            if sum >= random_for_percent
                percent = @monster_enchant.ENCHANT_PERCENT.split("|")[at].to_f
                
              if result.length == 0
                  hash = Hash.new
                  hash["RESULT_TYPE"] = "ENCHANT_RESULT"
                  hash["RESULT_VALUE"] = at
                  result[result.length] = hash

                  result_index = at                
              end
              
              break
            end
          end
        end
        
          if max_enchant == false
            #스킬 강화 확률 체크
            random_for_percent = rand(0..100)      
            percent = @monster_enchant.ENCHANT_PERCENT.split('|')[result_index].to_f
            
            if @material_monster.MONSTER_ID == @monster_instance.MONSTER_ID
              percent += @monster_enchant.EQUAL_MONSTER_SKILL_BONUS.to_f
            end
            
            if random_for_percent < percent
              skill_by_group = SkillScript.where(:SKILL_GROUP_ID => @skill_script.SKILL_GROUP_ID)
              sorted_group = skill_by_group.sort  { |x, y| x.SKILL_ID <=> y.SKILL_ID }

              index_count = 0
              sorted_group.each do |skill|
              break if skill.SKILL_ID.to_i == @skill_script.SKILL_ID.to_i    
              index_count += 1
              end
  
              skill_arr = @monster_instance.SKILL.split("|")
              
              skill_string = ""
              for n in 0...skill_arr.count
                if skill_arr[n].to_i == @skill_script.SKILL_ID.to_i
                    skill_string << sorted_group[index_count+1].SKILL_ID.to_s
                    @skill_script = sorted_group[index_count+1]
                    debug_logger("Skill Enchant Success")

                    if sorted_group.count - 1 <= index_count + 1
                      max_enchant = true 
                      debug_logger("Skill Enchant MAX")
                    end
                else
                  skill_string << skill_arr[n]
                end
                
                if n != skill_arr.count - 1
                  skill_string << "|"
                end
                
              end

              @monster_instance.SKILL = skill_string
              # 스킬 지급 완료
            else
              debug_logger(percent)
            end
        end

        if @monster_instance.LEVEL < 30
        # 경험치 지급
          if @material_monster.MONSTER_ID == @monster_instance.MONSTER_ID
            plus_exp =  (@monster_enchant.BASE_EXP.split("|")[result_index].to_i + (@monster_enchant.LEVEL_BONUS_EXP.split("|")[result_index].to_i * @material_monster.LEVEL.to_i)) * @monster_enchant.EQUAL_MONSTER_EXP_BONUS.to_i / 100
          else
            plus_exp =  (@monster_enchant.BASE_EXP.split("|")[result_index].to_i + (@monster_enchant.LEVEL_BONUS_EXP.split("|")[result_index].to_i * @material_monster.LEVEL.to_i))
          end

          reward_plus_exp += plus_exp.to_i

          @monster_instance.EXP = @monster_instance.EXP.to_i + plus_exp.to_i
          @monster_instance.TEAM_SLOT = params[:TEAM_SLOT]
          @monster_instance.CHARACTER_NO = params[:CHARACTER_NO]
          @monster_grow = MonsterGrow.where(:GROW_TYPE_DETAIL => @monster_instance.GROW_TYPE_DETAIL)
          @monster_grow = @monster_grow.sort { |x,y| x.LEVEL <=> y.LEVEL }
        
          for n in 0..@monster_grow.size-1
            if @monster_grow[n].REQUIRE_EXP.to_f <= @monster_instance.EXP.to_f 
              @monster_instance.LEVEL = @monster_grow[n].LEVEL
            else
              break
            end
          end
        end
        
        @user.CACHE_MONSTER_SLOT -= 1;
        @material_monster.destroy
      end
      
      @monster_instance.save
      add_result_monster(result, "MONSTER_EXP", reward_plus_exp.to_i, @monster_instance.MONSTER_NO)
      add_result_monster(result, "MONSTER_LEVEL", @monster_instance.LEVEL, @monster_instance.MONSTER_NO)

      @user.MONEY -= cost
      @user.save
      
      hash = Hash.new
      hash["RESULT_TYPE"] = "ENCAHNT_USER"
      hash["RESULT_VALUE"] = @user
      result[result.length] = hash
       
      hash = Hash.new
      hash["RESULT_TYPE"] = "ENCAHNT_MONSTER"
      hash["RESULT_VALUE"] = @monster_instance
      result[result.length] = hash
       
    end
    
    hash = Hash.new
    hash["RESULT_TYPE"] = "CHECK"
    hash["RESULT_VALUE"] = max_enchant
    result[result.length] = hash
            
    log_to_db("MONSTER_ENCHANT", @monster_instance.as_json.merge("ENCHANT_VALUE" => result_index).to_json, @user, @character)
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end
end
