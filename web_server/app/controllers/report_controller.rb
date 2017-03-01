class ReportController < ApplicationController
  def write
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user." + params[:user_no], 100015)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not find character." + params[:character_no], 100019)
    end
    
    @report_instance = ReportInstance.new(:REPORT_NO => sequence("report_instances"), :USER_NO => @user.USER_NO, :CHARACTER_NO => @character.CHARACTER_NO, :REPORT_TYPE => params[:report_type], :VALUE => params[:value],
        :USER_LV => @user.USER_LV, :EXP => @user.EXP, :ACTION_TIME => Time.now.utc, :IP => @remote_ip)
    @report_instance.save
    
    respond_to do |format|
      format.html 
      format.json { render json: @report_instance }
    end
  end
  
  def search
    @report_instances = ReportInstance.where("#{column_name("VALUE")} LIKE ?", "%#{params[:text]}%").limit(20)
    respond_to do |format|
      format.html 
      format.json { render json: @report_instance }
    end    
  end
  
end
