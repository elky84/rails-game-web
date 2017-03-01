class MasteryDropController < ApplicationController
  def get 
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    @mastery_instances = MasteryInstance.where(:USER_NO => params[:user_no] , :CHARACTER_NO => params[:character_no])
    
    if @mastery_instances == nil
      return error("not find mastery_instance" + params[:user_no], 100019)
    end 
    
    group_no = params[:group_no].to_i
    @mastery_instances.each { |mastery|
      if mastery.GROUP_NO.to_i == group_no
        group_no += 1
      end
    }
    
    if group_no > 3
    @mastery_instance = @mastery_instances[params[:group_no]]
     return error("max group size", 100019)  
    else
      #2015-12-24 특성 2페이지 10다이아 특성 3페이지 100다이아 설정 #2956 참조
      cost = 10
      if group_no == 3
        cost = 100
      end
      
      if @user.CASH < cost
        return message("not enough cash! your cash: " + @user.CASH.to_s, 100017)
      end
    
    @user.CASH -= cost
    @user.save
    
    @mastery_instance = MasteryInstance.new(:MASTERY_NO => sequence("mastery_instances"), :GROUP_NO => group_no, :USER_NO => params[:user_no], :CHARACTER_NO => params[:character_no], :MASTERY => "NONE")  
    @mastery_instance.save
    
    end
 
    respond_to do |format|
      format.html 
      format.json { render json: @mastery_instance }
    end
  end
end
