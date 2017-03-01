class DaycheckController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname]
  before_action :ip_check, only: [:find_by_nickname]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @daycheck_instances = DaycheckInstance.where(:USER_NO => user_no)

    respond_to do |format|
      format.html 
      format.json { render json: @daycheck_instances }
    end
  end
  
  
  def all
    @daycheck_instances = DaycheckInstance.where(:USER_NO => params[:user_no])
    respond_to do |format|
      format.html 
      format.json { render json: @daycheck_instances }
    end
  end

  def get
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. " + params[:user_no], 100000)
    end

    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
        
    @daycheck_instances = DaycheckInstance.where(:USER_NO => params[:user_no]).last
          
    if @daycheck_instances == nil
      # 신규 유저
      @daycheck_instances = DaycheckInstance.new( :DAYCHECK_NO => sequence("daycheck_instances"), :USER_NO => params[:user_no], :USER_TYPE => 0 , :DAYCHECK_ID => 1 , :TIME => Time.now, :CHECK => 0)
      mail_type = "DAYCHECK|NEW"
    elsif
      # 시간형식으로 변경
      time = @daycheck_instances.TIME.to_datetime.beginning_of_day()
      # 하루 단위로 값을 변경
      day_time = p((Time.now - time) / (60 * 60 * 24))
     
      if day_time >= 30
        #휴먼 계정으로 전환
        @daycheck_info =  Daycheck.where(:USER_TYPE => 1 , :DAY => 1).first
 
        @daycheck_instances = DaycheckInstance.new(:DAYCHECK_NO => sequence("daycheck_instances"), :USER_NO => params[:user_no], :USER_TYPE => 1 , :DAYCHECK_ID => @daycheck_info.DAYCHECK_ID , :TIME => Time.now , :CHECK => 0)       
  
        mail_type = "DAYCHECK|DORMANT"
      elsif day_time < 1
        # 별다른 작업할 필요 없다
        @daycheck_instances.CHECK = 1
        @daycheck_instances.save

      elsif day_time >= 1
        # 바로 다음 선물 보내기
        # 전에거보다 하나 증가한 다음 선물을 준다
        # 28보다 크면 기본으로 변경후 1부터 다시 준다
        @daycheck_info =  Daycheck.where(:DAYCHECK_ID => @daycheck_instances.DAYCHECK_ID).last
     
        if @daycheck_info.DAY >= 28
          @daycheck_info =  Daycheck.where(:USER_TYPE => 2 , :DAY => 1).first
        else
          @daycheck_info =  Daycheck.where(:USER_TYPE => @daycheck_info.USER_TYPE , :DAY => @daycheck_info.DAY + 1).first
        end
    
        @daycheck_instances = DaycheckInstance.new(:DAYCHECK_NO => sequence("daycheck_instances"), :USER_NO => params[:user_no], :USER_TYPE => @daycheck_info.USER_TYPE , 
          :DAYCHECK_ID => @daycheck_info.DAYCHECK_ID , :TIME => Time.now, :CHECK => 0)
          
        mail_type = "DAYCHECK|NORMAL"
      end
    end
     
    # application에 선물하기 만들고 선물
    if @daycheck_instances.CHECK == 0
      @daycheck_info =  Daycheck.where(:DAYCHECK_ID => @daycheck_instances.DAYCHECK_ID).first
       
      user_no = params[:user_no]
      sender_no = 1
      reward = @daycheck_info.REWARD
      title = "출석 보상"
      content = @daycheck_info.DAY.to_s + "일 출석보상"
      icon = "icon"
      end_date = Time.now + (60 * 60 * 24 * 3)
       
      debug_logger(mail_type)
      
      @item_instances = ItemInstance.where(:USER_NO => user_no).where("#{column_name("END_DATE")} >= '#{Time.now.utc}' AND #{column_name("DEFAULT_OPTION")} like 'MONTH%' OR #{column_name("OPTION_LIST")} like 'MONTH%'")
      @item_instances.each do |item|
        if false == daily_flatrate(params[:user_no], item)
          return false
        end
      end
       
      # 메일 타입 설정 (MAIL_RECEIVE_TYPE 파일 참조)
      # mail_type = "DAYCHECK|NORMAL"
      if false == send_to_mail(user_no,sender_no,title,content,reward,icon,end_date,mail_type)
        return
      end
      
      # @daycheck_instances.CHECK = 1
      @daycheck_instances.save
       
      @user.FRIEND_DELETE_COUNT = 0
      @user.save
     end
     
     log_to_db("DAY_CHECK", @daycheck_instances.to_json, @user, @character)
     
      respond_to do |format|
        format.html 
        format.json { render json: @daycheck_instances }
      end
  end


  def update
    
  end

  def destroy
  end
end