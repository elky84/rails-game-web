class SkillController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname]
  before_action :ip_check, only: [:find_by_nickname]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @character = CharacterInstance.where(:USER_NO => user_no, :CHARACTER_ID => params[:character_id]).first
    if @character == nil
      return error("not find character" + params[:character_id], 100019)
    end
    
    @skill_instances = SkillInstance.where(:CHARACTER_NO => @character.CHARACTER_NO)

    respond_to do |format|
      format.html 
      format.json { render json: @skill_instances }
    end
  end
    
  def all
    @skill_instances = SkillInstance.where(:CHARACTER_NO => params[:character_no])
    respond_to do |format|
      format.html 
      format.json { render json: @skill_instances }
    end
  end

  def save
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user no: " + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    count = params[:COUNT]

    for n in 0..count.to_i-1
      at = "PARAMS_" + n.to_s
      skill = params[at]
      
      @skill_instance = SkillInstance.where(:SKILL_NO => skill[:SKILL_NO]).first
      if @skill_instance == nil
        return error("not find skill_instance. skill_no:" + skill[:SKILL_NO], 100048)
      end
      
      @skill_instance.SLOT_NO = skill[:SLOT_NO]
      @skill_instance.save
    end 

    log_to_db("SKILL_SAVE", @skill_instance.to_json, @user, @character)

    message("update success", 0)
  end

  def enchant    
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user no: " + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
      
    skill_no = params[:SKILL_NO]
    skill_id = params[:SKILL_ID]

    @skill_script = SkillScript.where(:SKILL_ID => skill_id).first
    if @skill_script == nil
      return error("not find skill_script. skill_id:" + skill_id, 100049)
    end
    
    #------------------------------------------------------------------------
    @skill_script_by_group_id = SkillScript.where(:SKILL_GROUP_ID => @skill_script.SKILL_GROUP_ID)
    if @skill_script_by_group_id == nil
      return error("not find skill_script. skill_script_by_group_id" + @skill_script_by_group_id, 100049)
    end

    @skill_script_by_group_id = @skill_script_by_group_id.order(:SKILL_ID)
    skill_sorted_by_group_id = @skill_script_by_group_id.to_a 

    #------------------------------------------------------------------------

    @skill_instance = SkillInstance.where(:SKILL_NO => skill_no).first    
    if @skill_instance == nil
      return error("not find skill_instance. skill_no:" + skill_no, 100048)
    end
        
    result = Hash.new

    cost = 0
    @monster_array = Array.new
    
    skill_level = @skill_instance.SKILL_LEVEL
    skill_up_count = 0
    
    count = params[:count]
    for param_index in 1..count.to_i
      monster_no = params["monster_no"+param_index.to_s]
      @monster_instance = MonsterInstance.where(:MONSTER_NO => monster_no).first
      if @monster_instance == nil
        return error("not find monster. monster_no:" + monster_no, 100040)
      end
      
      @monster_array.push(@monster_instance)      
      if 5 <= @skill_instance.SKILL_LEVEL
        next
      end 

      
      @monster_info = MonsterInfo.where(:MONSTER_ID => @monster_instance.MONSTER_ID).first
      if @monster_info == nil
        return error("not find monster_info. monster_id:" + @monster_instance.MONSTER_ID.to_s, 100041)
      end
      
      @skill_enchant = SkillEnchant.where(:ENCHANT_NUM => @skill_instance.SKILL_LEVEL, :MONSTER_GRADE => @monster_info.MONSTER_GRADE).first
      if @skill_enchant == nil
        return error("not find skill_enchant. monster_id:" + @monster_instance.MONSTER_ID.to_s + " skill_level:" + @skill_instance.SKILL_LEVEL.to_s + " monster_grade:" + @monster_info.MONSTER_GRADE.to_s, 100050)
      end

      @skill_enchant_for_cost = SkillEnchant.where(:ENCHANT_NUM => skill_level, :MONSTER_GRADE => @monster_info.MONSTER_GRADE).first
      if @skill_enchant_for_cost == nil
        return error("not find skill_enchant. monster_id:" + @monster_instance.MONSTER_ID.to_s + " skill_level:" + @skill_instance.SKILL_LEVEL.to_s + " monster_grade:" + @monster_info.MONSTER_GRADE.to_s, 100050)
      end
      
      cost += @skill_enchant_for_cost.MONEY
      
      sum = 0.0
      percent = 0.0
            
      enchant_result = @skill_enchant.ENCHANT_RESULT.split("|")
       
      total_value_for_percent = 0.0  
      for at in 0...enchant_result.length
        total_value_for_percent += enchant_result[at].to_f 
      end
      
      random_for_percent = rand(0..total_value_for_percent)
       
      for at in 0...enchant_result.length
        sum += enchant_result[at].to_f    
        if sum >= random_for_percent
          percent = @skill_enchant.ENCHANT_PERCENT.split("|")[at].to_f
          break
        end
      end
      
      random_for_result = rand(0..100)
      if percent > random_for_result.to_f
        skill_up_count += 1
      end
    end
    
    index_count = 0
    skill_sorted_by_group_id.each do |skill|
      break if skill.SKILL_ID.to_i == skill_id.to_i    
      index_count += 1
    end
    
    debug_logger(index_count)
    
    if skill_up_count > 0
       upcount = index_count + skill_up_count
       
       if upcount >= skill_sorted_by_group_id.count
         upcount = skill_sorted_by_group_id.count - 1
       end
       
      learn_skill = skill_sorted_by_group_id[upcount]
      
      @skill_instance.SKILL_ID = learn_skill.SKILL_ID
      @skill_instance.SKILL_LEVEL  = learn_skill.LEVEL
      @skill_instance.save
    end

    if @user.MONEY < cost
      return message("not enough money " + @user.MONEY + " enchant_money " + cost.to_s, 100045)
    end

    @user.MONEY = @user.MONEY - cost

    add_result(result, "USER_MONEY", @user.MONEY)

    @monster_array.each do |monster|
      @user.CACHE_MONSTER_SLOT -= 1;
      monster.destroy
    end
    
    @skill_instance.save
    @user.save
    
    result[result.length] = @skill_instance.as_json.merge("RESULT_TYPE" => "SKILL")
        
    add_result(result, "USER", @user)
    
    log_to_db("SKILL_ENCHANT", @skill_instance.as_json.merge("ENCHANT_VALUE" => skill_up_count).to_json, @user, @character)
            
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end

  def learn
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not find character. " + params[:user_no] + " character_no:" + params[:character_no], 100019)
    end

    @user = UserInstance.where(:USER_NO => @character.USER_NO).first
    if @user == nil
      return error("not find user. " + params[:user_no], 100000)
    end
    
    skill_id = params[:skill_id]

    @skill_script = SkillScript.where(:SKILL_ID => skill_id).first
    if @skill_script == nil
      return error("not find SkillScript. skill_id: " + skill_id, 100049)
    end
    
    str = @skill_script.LEARN_CONDITION.split("_")
    learn_money = str[1].to_i
    
    if @user.MONEY < learn_money
      return message("not enough user MONEY: " + params[:user_no] + "money:" + @user.MONEY.to_s + "<" + learn_money.to_s, 100045)      
    end
    
    @user.MONEY -= learn_money
    @user.save

    @skill_instance = SkillInstance.new(:SKILL_NO => sequence("skill_instances"), :SKILL_ID => skill_id, :CHARACTER_NO => params[:character_no], :SLOT_NO => -1, :SKILL_LEVEL => 1)
    @skill_instance.save
    
    log_to_db("SKILL_LEARN", @skill_instance.to_json, @user, @character)
    
    respond_to do |format|
      format.html 
      format.json { render json: @skill_instance }
    end
  end
end