class EventController < ApplicationController
  def save
    start_date, end_date = to_datestr()
    @event_instances = EventInstance.new(:REWARD => shop_category_to_reward(params[:type]) + "_" + params[:value], 
      :EVENT_TYPE => params[:event_type], :EVENT_NO => sequence("event_instances"), :START_DATE => start_date, :END_DATE => end_date)
    @event_instances.save
    
    respond_to do |format|
      format.html 
      format.json { render json: @event_instances }
    end
  end
end
