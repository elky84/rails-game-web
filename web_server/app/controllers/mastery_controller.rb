class MasteryController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @mastery_instances = MasteryInstance.where(:USER_NO => user_no)

    respond_to do |format|
      format.html 
      format.json { render json: @mastery_instances }
    end
  end
  
  def all
    @mastery_instances = MasteryInstance.where(:USER_NO => params[:user_no] , :CHARACTER_NO => params[:character_no])
    respond_to do |format|
      format.html 
      format.json { render json: @mastery_instances }
    end
  end
  
  def buypoint
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100020)
    end

    if @user.MASTERY_POINT == nil
      @user.MASTERY_POINT = 1
    end

    @mastery_point_info = MasteryPointInfo.where(:MASTERY_POINT => @user.MASTERY_POINT).first
    if @mastery_point_info == nil
      return error("not find mastery_point_info. MASTERY_POINT:" + @user.MASTERY_POINT.to_s, 100068)
    end
    
    if @mastery_point_info.PRICE_TYPE == "MONEY"
      if @user.MONEY < @mastery_point_info.PRICE
        return message("not enough cost. user MONEY:" + @user.MONEY.to_s + ", need PRICE:" + @mastery_point_info.PRICE.to_s, 100045)
      else
        @user.MONEY -= @mastery_point_info.PRICE
      end
    elsif @mastery_point_info.PRICE_TYPE == "DIAMOND"
      if @user.CASH < @mastery_point_info.PRICE
        return message("not enough cost. user DIAMOND:" + @user.CASH.to_s + ", need PRICE:" + @mastery_point_info.PRICE.to_s, 100046)
      else
        @user.CASH -= @mastery_point_info.PRICE
      end
    elsif @mastery_point_info.PRICE_TYPE == "FRIEND_POINT"
      if @user.FRIEND_POINT < @mastery_point_info.PRICE
        return message("not enough cost. user FRIEND_POINT:" + @user.FRIEND_POINT.to_s + ", need PRICE:" + @mastery_point_info.PRICE.to_s, 100047)
      else
        @user.FRIEND_POINT -= @mastery_point_info.PRICE
      end
    else
      return error("invalid cost type. " + @reset_cost.COST.to_s, 120007)     
    end
    
    log_to_db("MASTERY_BUY_POINT", @mastery_point_info.to_json, @user, @character)

    @user.MASTERY_POINT += 1
    
    @user.save
    
    respond_to do |format|
      format.html
      format.json {render json: @user}
    end
    
  end
end
