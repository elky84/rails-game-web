class StampController < ApplicationController
  before_action :auth_check

  def set    
    @quest_instances = QuestInstance.where(:USER_NO => params[:user_no] , :QUEST_APPLY_TYPE => "STAMP")
    
    max = 1
    if @quest_instances != nil
        @quest_instances.each { |instance|
         if instance.GROUP_ID > max
           max = instance.GROUP_ID
         end
      }
    end
    
    # 가지고 있는 그룹에서 모두 해결 했을때 다음 그룹 까지 가져 와야 한다/
    
    @quest_info = QuestInfo.where(:QUEST_APPLY_TYPE => "STAMP" , :GROUP_ID => max)
    
    if @quest_info == nil
         return error("not found quest_info", 120001)
    end

    respond_to do |format|
      format.html 
      format.json { render json:   @quest_info}
    end
    
  end

  def get
      @quest_instances = QuestInstance.where(:USER_NO => params[:user_no] , :QUEST_APPLY_TYPE => "STAMP")

      if @quest_instances.count < 1
         @quest_info = QuestInfo.where(:QUEST_APPLY_TYPE => "STAMP" , :GROUP_ID => 1)

          if @quest_info == nil
             return error("not found quest_info", 120001)
          end
          
          @quest_info.each do |info|
          # 생성 부는 고용 코드로 빼기 퀘스트에서도 사용하고 있다
          @quest_types = QuestType.where(:QUEST_TYPE_ID => info.QUEST_TYPE_ID).first

          if @quest_types == nil
             return error("not found @quest_types", 120001)
          end

          quest_value = 0
          if @quest_types.TYPE == "STAGE_CLEAR_COMPLETE"
            @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => params[:character_no]).first
            if @stage_clear_instance == nil
              return error("not find item " + params[:user_no], 100051)
            end
            
            play_stage = @stage_clear_instance.CLEAR_STAGE.split("|")
            if nil != @stage_clear_instance.CLEAR_STAGE.index(info.GRADE.to_s)
              quest_value = info.MAXVALUE
            end
          end
              
          @quest_instance = QuestInstance.new( :QUEST_NO => sequence("quest_instances"), :QUEST_INFO_ID => info.QUEST_INFO_ID, :USER_NO => params[:user_no],
          :TYPE => @quest_types.TYPE ,:QUEST_VALUE => quest_value,  :ACTIVE_TIME => Time.now.utc, :CLEAR => false , :CLEAR_TIME => Time.new(1990).utc , 
          :GRADE => info.GRADE , :QUEST_APPLY_TYPE => "STAMP" , :GROUP_ID => info.GROUP_ID)
          @quest_instance.save
        
          #@quest_instances << @quest_instance
          debug_logger(@quest_instance.QUEST_INFO_ID)
        end
      end
      debug_logger("퀘스트 인스턴스 카운트")
      debug_logger(@quest_instances.count)
       
      max = 1      
      if @quest_instances != nil
         @quest_instances.each do |instance|
         if instance.GROUP_ID > max
           max = instance.GROUP_ID
         end
      end
      
      debug_logger("퀘스트 최고 그룹")
      debug_logger(max)   
         
      end
      
      all_clear = true
      
      @quest_instances.each do |instance|
        #debug_logger(instance.CLEAR)
        if instance.CLEAR.to_i != 1
           all_clear = false
            debug_logger("이 퀘스트인스턴스가 클리어 아님")
           debug_logger(instance.QUEST_NO)   
           break
        end
      end
      
      if all_clear == true
        @quest_info = QuestInfo.where(:QUEST_APPLY_TYPE => "STAMP" , :GROUP_ID => max + 1)
          
          no_data = false
          
          if @quest_info == nil
                 no_data = true
          end
          
          if no_data == false          
                @quest_info.each { |info|
                @quest_types = QuestType.where(:QUEST_TYPE_ID => info.QUEST_TYPE_ID).first
      
                if @quest_types == nil
                     return error("not found @quest_types", 120001)
                end
      
                    quest_value = 0
                    if(@quest_types.TYPE == "STAGE_CLEAR_COMPLETE")
                          @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => params[:character_no]).first
                          if @stage_clear_instance == nil
                            return error("not find item " + params[:user_no], 100051)
                          end
                          
                          play_stage = @stage_clear_instance.CLEAR_STAGE.split("|")
                          if nil != @stage_clear_instance.CLEAR_STAGE.index(info.GRADE.to_s)
                            quest_value = info.MAXVALUE
                          end
                    end
                
                @quest_instance = QuestInstance.new( :QUEST_NO => sequence("quest_instances"), :QUEST_INFO_ID => info.QUEST_INFO_ID, :USER_NO => params[:user_no],
                :TYPE => @quest_types.TYPE ,:QUEST_VALUE => quest_value,  :ACTIVE_TIME => Time.now.utc, :CLEAR => false , :CLEAR_TIME => Time.new(1990).utc , 
                :GRADE => info.GRADE , :QUEST_APPLY_TYPE => "STAMP" , :GROUP_ID => info.GROUP_ID)
                @quest_instance.save
              
                #@quest_instances << @quest_instance
                debug_logger(@quest_instance.QUEST_INFO_ID)
            }
          end
          
          @quest_instances = QuestInstance.where(:USER_NO => params[:user_no] , :QUEST_APPLY_TYPE => "STAMP")
          debug_logger = @quest_instances.count
      end
      
    respond_to do |format|
      format.html 
      format.json { render json: @quest_instances }
    end
     
  end

  def reward
  end
end
