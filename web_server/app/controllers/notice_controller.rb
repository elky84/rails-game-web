class NoticeController < ApplicationController
  before_action :ip_check, only: [:save]

  def get
    @notice_instances = NoticeInstance.where("#{column_name("START_DATE")} < '#{Time.now.utc}' AND #{column_name("END_DATE")} > '#{Time.now.utc}'")
    
    respond_to do |format|
      format.html 
      format.json { render json: @notice_instances }
    end
  end
  
  def save
    start_date, end_date = to_datestr()
    notice_no = 
    @notice_instances = NoticeInstance.new(:NOTICE_NO => sequence("notice_instances"),
      :CONTENT => params[:content],  
      :NOTICE_TYPE => params[:notice_type], :START_DATE => start_date, :END_DATE => end_date)
    @notice_instances.save
    
    respond_to do |format|
      format.html 
      format.json { render json: @notice_instances }
    end
  end
end
