class MaxvalueController < ApplicationController
  def get
    # 필요 파라메터 : 슬롯타입 / 유저번호 
    debug_logger(params[:slot_type])
    
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. " + params[:user_no], 100000)
    end
    
    # 슬롯 타입별로 
    if params[:slot_type] == "PARTY"
      ext_slot = @user.EXT_MONSTER_SLOT
      @maxvalue = MaxValueInfo.where(:MAX_SLOT_TYPE => params[:slot_type], :EXT_SLOT => ext_slot).first
      if @maxvalue == nil
        return error("not find max_value.")
      end
      
      is_able = false

      if @maxvalue.NEXT_COST.to_s.split("_")[0] == "G"
        if @user.MONEY >= @maxvalue.NEXT_COST.to_s.split("_")[1].to_i
          @user.MONEY -= @maxvalue.NEXT_COST.to_s.split("_")[1].to_i
          is_able = true
        end
      elsif @maxvalue.NEXT_COST.to_s.split("_")[0] == "D"
        if @user.CASH >= @maxvalue.NEXT_COST.to_s.split("_")[1].to_i
          @user.CASH -= @maxvalue.NEXT_COST.to_s.split("_")[1].to_i
          is_able = true
        end
      else
        return error("not defined." + @maxvalue.NEXT_COST.to_s)
      end
      
      if is_able
        @user.EXT_MONSTER_SLOT = @maxvalue.NEXT_EXT_SLOT
      end
      
      log_to_db("EXT_SLOT_PARTY", @maxvalue.to_json, @user, @character)
      
      @user.save
    elsif params[:slot_type] == "EQUIP"
      ext_slot = @user.EXT_ITEM_SLOT
      @maxvalue = MaxValueInfo.where(:MAX_SLOT_TYPE => params[:slot_type], :EXT_SLOT => ext_slot).first
      if @maxvalue == nil
        return error("not find max_value.")
      end

      is_able = false
      
      if @maxvalue.NEXT_COST.to_s.split("_")[0] == "G"
         if @user.MONEY >= @maxvalue.NEXT_COST.to_s.split("_")[1].to_i
           @user.MONEY -= @maxvalue.NEXT_COST.to_s.split("_")[1].to_i
           is_able = true
         end
      elsif @maxvalue.NEXT_COST.to_s.split("_")[0] == "D"
        if @user.CASH >= @maxvalue.NEXT_COST.to_s.split("_")[1].to_i
          @user.CASH -= @maxvalue.NEXT_COST.to_s.split("_")[1].to_i
          is_able = true
        end
      else
        return error("not defined." + @maxvalue.NEXT_COST.to_s)
      end

      if is_able
         @user.EXT_ITEM_SLOT = @maxvalue.NEXT_EXT_SLOT
         debug_logger(@maxvalue.NEXT_EXT_SLOT)
      end
      
      log_to_db("EXT_SLOT_EQUIP", @maxvalue.to_json, @user, @character)
      
      @user.save
    end
    
    
    # 여기서 체크 하고 유저 보내기
    result = Hash.new
     
    hash = Hash.new
    hash["RESULT_TYPE"] = "CHECK"
    hash["RESULT_VALUE"] = is_able
    result[result.length] = hash
          
    hash = Hash.new
    hash["RESULT_TYPE"] = "USER"
    hash["RESULT_VALUE"] = @user
    result[result.length] = hash

    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
    
  end
end
