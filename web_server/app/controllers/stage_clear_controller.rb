class StageClearController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])

    @character = CharacterInstance.where(:USER_NO => user_no, :CHARACTER_ID => params[:character_id]).first
    if @character == nil
      return error("not find character" + params[:character_id], 100019)
    end

    @stage_clear_instances = StageClearInstance.where(:CHARACTER_NO => @character.CHARACTER_NO)

    respond_to do |format|
      format.html 
      format.json { render json: @stage_clear_instances }
    end
  end
  
  def all
    @stage_clear_instances = StageClearInstance.where(:CHARACTER_NO => params[:character_no])
     
    if @stage_clear_instances == nil
      return error("not find item" + params[:user_no], 100051)
    end
     
    respond_to do |format|
      format.html 
      format.json { render json: @stage_clear_instances }
    end
  end

  def get
    @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @stage_clear_instance == nil
      return error("not find item" + params[:user_no], 100051)
    end
   
    respond_to do |format|
      format.html 
      format.json { render json: @stage_clear_instance }
    end
  end

  def new
    @stage_clear_instance = StageClearInstance.new(:CHARACTER_NO => params[:character_no],
     :CLEAR_STAGE => params[:CLEAR_STAGE], :STAGE_SCORE => params[:STAGE_SCORE], :LAST_DATE => Time.now, :PLAY_STAGE => params[:PLAY_STAGE])
    @stage_clear_instance.save
  
    respond_to do |format|
      format.html 
      format.json { render json: @stage_clear_instance }
    end
  end

  def save
    @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @stage_clear_instance == nil
      return error("not find item" + params[:user_no], 100051)
    end
    
    @stage_clear_instance.CLEAR_STAGE = params[:CLEAR_STAGE]
    @stage_clear_instance.STAGE_SCORE = params[:STAGE_SCORE]
    
    @stage_clear_instance.save
    
    respond_to do |format|
      format.html 
      format.json { render json: @stage_clear_instance }
    end
  end

  def destroy
    @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => params[:character_no]).first
    
    if @stage_clear_instance == nil
      return error("not find item" + params[:user_no], 100051)
    end      
    
    @stage_clear_instance.destroy
    message("destroy complete", 0)
  end
    
end
