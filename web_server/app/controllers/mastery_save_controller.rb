class MasterySaveController < ApplicationController
  before_action :auth_check
  
  def reset
    # 파라메터 => 유저 넘버 그룹넘버 케릭터 넘버
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
                
    @mastery_instances = MasteryInstance.where(:USER_NO => params[:user_no], :GROUP_NO => params[:group_no], :CHARACTER_NO => params[:character_no]).first
    if @mastery_instances == nil
      return error("not find item" + params[:user_no])
    end
    
    @reset_cost = MasteryReset.where(:MASTERY_RESET_ID => @user.MASTERY_RESET_COUNT).first
    if @reset_cost == nil
      return error("not find mastery reset. MASETERY_RESET_COUNT : " + @user.MASTERY_RESET_COUNT.to_s, 100075)
    end

    if @reset_cost.COST.to_s.split("_")[0] == "G"
      if @user.MONEY < @reset_cost.COST.to_s.split("_")[1].to_i
        return message("not enough money. MONEY : " + @user.MONEY.to_s, 100045)
      else
         @user.MONEY -= @reset_cost.COST.to_s.split("_")[1].to_i
      end
    elsif @reset_cost.COST.to_s.split("_")[0] == "D"
      if  @user.CASH < @reset_cost.COST.to_s.split("_")[1].to_i
        return message("not enough money. CASH : " + @user.MONEY.to_s, 100046)
      else
        @user.CASH -= @reset_cost.COST.to_s.split("_")[1].to_i
       end
    else
      return error("invalid cost type. " + @reset_cost.COST.to_s, 120007)     
    end
    
    @user.MASTERY_RESET_COUNT += 1
    if @user.MASTERY_RESET_COUNT > MasteryReset.maximum("MASTERY_RESET_ID")
      @user.MASTERY_RESET_COUNT = 0
    end
    
    @mastery_instances.MASTERY = "NONE"

    @user.save
    @mastery_instances.save
    
    result = Hash.new        
      
    hash = Hash.new
    hash["RESULT_TYPE"] = "USER"
    hash["RESULT_VALUE"] = @user
    result[result.length] = hash
          
    hash = Hash.new
    hash["RESULT_TYPE"] = "MASTERY"
    hash["RESULT_VALUE"] = @mastery_instances
    result[result.length] = hash

    respond_to do |format|
      format.html 
      format.json { render json: result }
    end

  end
  
  def save
    @user = UserInstance.where(:USER_NO => params[:USER_NO]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:USER_NO] + " ITEM_NO:" + params[:ITEM_NO], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    @mastery_instances = MasteryInstance.where(:USER_NO => params[:user_no], :GROUP_NO => params[:GROUP_NO], :CHARACTER_NO => params[:CHARACTER_NO]).first
    
    if @mastery_instances == nil
      return error("not find item" + params[:user_no])
    end
    
    @character.MASTERY_GROUP_ID = params[:GROUP_NO]
    @character.save
  
    @mastery_instances.MASTERY = params[:MASTERY]

    @mastery_instances.save

    message("update success", 0)
  end
end
