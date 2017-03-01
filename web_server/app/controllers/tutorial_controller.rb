class TutorialController < ApplicationController
  before_action :auth_check
  
  def set
    @tutorial_instance = TutorialInstance.where(:USER_NO => params[:user_no]).first

    if @tutorial_instance == nil
      @tutorial_instance = TutorialInstance.new(:TUTORIAL_NO => sequence("tutorial_instances"), :USER_NO => params[:user_no],
                                                :FLOW_NO => 0 , :GACHA_GET_INSTANCE_NO => 0 , :STAGE_GET_INSTANCE_NO => 0)
      @tutorial_instance.save
    end

    respond_to do |format|
      format.html
      format.json { render json: @tutorial_instance }
    end

  end

  def get
    @tutorial_instance = TutorialInstance.where(:USER_NO => params[:user_no]).first
    if @tutorial_instance == nil
      # 기존의 튜토리얼 저장 방식으로  저장하던 유저는 완료로 변경
      @tutorial_instance = TutorialInstance.new(:TUTORIAL_NO => sequence("tutorial_instances"), :USER_NO => params[:user_no],
                                                :FLOW_NO => "END" , :GACHA_GET_INSTANCE_NO => 0 , :STAGE_GET_INSTANCE_NO => 0)
      @tutorial_instance.save
    end

    respond_to do |format|
      format.html
      format.json { render json: @tutorial_instance }
    end

  end

  def update
    @tutorial_instance = TutorialInstance.where(:USER_NO => params[:user_no]).first
    if @tutorial_instance == nil
      # UI TEXT 숫자 변경 해야함
      return error("not found @tutorial_instance", 120001)
    end
    
    @tutorial_instance.FLOW_NO = params[:FLOW_NO]
    
    if @tutorial_instance.GACHA_GET_INSTANCE_NO.to_i == 0
      @tutorial_instance.GACHA_GET_INSTANCE_NO = params[:GACHA_GET_INSTANCE_NO]
    end
    
    if @tutorial_instance.STAGE_GET_INSTANCE_NO.to_i == 0
      @tutorial_instance.STAGE_GET_INSTANCE_NO = params[:STAGE_GET_INSTANCE_NO]
    end
    
    @tutorial_instance.save
    
    respond_to do |format|
      format.html
      format.json { render json: @tutorial_instance }
    end
  end

  def destroy
  end
end
