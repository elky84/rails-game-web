class LogController < ApplicationController
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @log_instances = LogInstance.where(:USER_NO => user_no)
    
    respond_to do |format|
      format.html 
      format.json { render json: @log_instances }
    end
  end
  
  def find_by_action
    user_no = nickname_to_user_no(params[:nickname])
    @log_instances = LogInstance.where("#{column_name("USER_NO")} = #{user_no} and #{column_name("LOG_TYPE")} LIKE '#{params[:log_action]}%'")
    
    respond_to do |format|
      format.html 
      format.json { render json: @log_instances }
    end
  end
  
  def payment
    user_no = nickname_to_user_no(params[:nickname])
    @log_instances = LogInstance.where("#{column_name("USER_NO")} = #{user_no} and #{column_name("LOG_TYPE")} = 'CHARGE_DIAMOND'")
    
    respond_to do |format|
      format.html 
      format.json { render json: @log_instances }
    end
  end
  
  def payment_list
    start_date, end_date = to_datestr()
    @log_instances = LogInstance.where("#{column_name("LOG_TYPE")} = 'CHARGE_DIAMOND' and #{column_name("ACTION_TIME")} > '#{start_date}' and #{column_name("ACTION_TIME")} < '#{end_date}'")
    
    respond_to do |format|
      format.html 
      format.json { render json: @log_instances }
    end
  end
end
