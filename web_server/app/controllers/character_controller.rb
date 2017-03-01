class CharacterController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname]
  before_action :ip_check, only: [:find_by_nickname]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @character_instances = CharacterInstance.where(:USER_NO => user_no)

    respond_to do |format|
      format.html 
      format.json { render json: @character_instances }
    end
  end
  
  def new
    user = UserInstance.where(:USER_NO => params[:user_no]).first
    if user == nil
      return error("not find user. ITEM_NO:" + params[:user_no], 100015)
    end
   
    @character_info = CharacterInfo.where(:CHARACTER_ID => params[:character_id]).first;
    if @character_info == nil
      return error("not find character_info. user_no:" + params[:user_no] + " character_id:" + params[:character_id], 100016)
    end
    
    if user.CASH < @character_info[:PRICE]
      return error("money is not enough : " + params[:user_no] + "cash : " + user.CASH.to_s + " < " + @character_info[:PRICE].to_s, 100017)
    end
    
    user.CASH -= @character_info[:PRICE];
    
    @character = CharacterInstance.new( :CHARACTER_NO => sequence("character_instances"), :USER_NO => params[:user_no] , :CHARACTER_ID => params[:character_id], 
    :LEVEL => 1, :EXP => 0, :LASTEST_ACTIVE_TIME => Time.now, :MASTERY_GROUP_ID => 1 , :STAGE_INSTANCE_NO => 0 , 
    :PARTY_MONSTER_ID => "NONE", :COSTUME_ID => 0)
    
    @mastery_instance = MasteryInstance.new( :MASTERY_NO => sequence("mastery_instances"), :GROUP_NO => 1, :USER_NO => params[:user_no], :CHARACTER_NO => @character.CHARACTER_NO, :MASTERY => "NONE")
    
    # pvp instance도 같이 new 합니당 dhchoi
    @pvp_instances = PvpInstance.new(:CHARACTER_NO => @character.CHARACTER_NO, :CHARACTER_LV => 1, :CHARACTER_ID => params[:character_id], :USER_NICKNAME => user.NICKNAME, :USER_LV => user.USER_LV, :RATING => 1000, :PARTY_ATTACKER => 0, :ATTACKER_POWER => 1000, :PARTY_DEFENDER => 0, :DEFENDER_POWER => 1000, 
                                     :SEASON_NUM => 0, :IS_SUCCESSION_VICTORY => "true", :SUCCESSION_COUNT => 0, :VICTORY_COUNT => 0, :DEFEAT_COUNT => 0, :CUR_MATCH_NO => 1, :RANK => 0, :COSTUME_ID => 0, :USER_NO => params[:user_no])

    @stage_clear_instance = StageClearInstance.new(:USER_NO => params[:user_no], :CHARACTER_NO => @character.CHARACTER_NO, :CLEAR_STAGE => "", :STAGE_SCORE => "", :PLAY_STAGE => "", :LAST_DATE => Time.now )    

    @actor_status_script = ActorStatusScript.where(:index => @character_info.ACTOR_ID).first
    if @actor_status_script == nil
      return error("invalid character_info: " + @character_info.ACTOR_ID.to_s, 100018)
    end
    
    str_skill = @actor_status_script.skill_list.split("|")
    for i in 0...str_skill.length
      @skill_instance = SkillInstance.new( :SKILL_NO => sequence("skill_instances"), :SKILL_ID => str_skill[i], :CHARACTER_NO => @character.CHARACTER_NO, :SLOT_NO => i, :SKILL_LEVEL => 1)
	    @skill_instance.save
    end

    user.save
    @character.save
    @pvp_instances.save
    @mastery_instance.save
    @stage_clear_instance.save

 ##########################################
    result = Hash.new
    get_character_list(result, user)
    @character_hash = result[result.length - 1]["RESULT_VALUE"]
    if @character_hash == nil
      return error("not find character_instnace_list in hash", 0)
    end
    
    get_monster(result, user)
    get_item(result , user)
    get_skill(result , user , @character_hash)
    get_mastery(result , user , @character_hash)
    get_stage(result , user , @character_hash)      
    @stage_clear_hash = result[result.length - 1]["RESULT_VALUE"]
    if @stage_clear_hash == nil
      return error("not find @stage_clear in hash", 0)
    end  
    
    @update_time = Time.new(1990)
    get_friend(result , user, @update_time)
    get_mail(result , user , @update_time)
    
    get_pvp(result)
    get_tutorial(result , user)

    get_quest(result , user,@stage_clear_hash)
##########################################

    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end

  def delete
    # ToDo : need mastery_instance Destroy 
    @character = CharacterInstance.where(:USER_NO => params[:user_no], :CHARACTER_NO => params[:Charactor_id]).first
    if @character == nil
     return error("not find character: " + params[:charactor_id], 100019)
    end
        
    message("deleted charator. user_no: " + params[:user_no] + " charactor_id: " + params[:Charactor_id], 100022)

    @character.destroy
    
  end
  
  def list
    @character_instances = CharacterInstance.where(:USER_NO => params[:user_no])

    respond_to do |format|
      format.html 
      format.json { render json: @character_instances }
    end
  end
  
  def get
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not found character no " + params[:character_no], 100021)
    end
    debug_logger(@character.CHARACTER_NO)
    respond_to do |format|
      format.html 
      format.json { render json: @character }
    end
  end

end
