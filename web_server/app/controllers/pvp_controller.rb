class PvpController < ApplicationController
  before_action :auth_check, except: [:find_by_nickname, :get_period, :end_of_competition_1st, :end_of_competition_2nd]
  before_action :ip_check, only: [:find_by_nickname, :end_of_competition_1st, :end_of_competition_2nd]
  
  def find_by_nickname
    user_no = nickname_to_user_no(params[:nickname])
    @pvp_instances = PvpInstance.where(:USER_NO => user_no)

    respond_to do |format|
      format.html 
      format.json { render json: @pvp_instances }
    end
  end
  
   
  def new #필요없을지도...? 
    @pvp_instances = PvpInstance.new(:CHARACTER_NO => character_no, :RATING => 1000, :PARTY_ATTACKER => 0, :ATTACKER_POWER => 1000, :PARTY_DEFENDER => 0, :DEFENDER_POWER => 1000, 
                                     :IS_SUCCESSION_VICTORY => "true", :SUCCESSION_COUNT => 0, :VICTORY_COUNT => 0, :DEFEAT_COUNT => 0)
    @pvp_instances.save                                                                
  end

  def get
    @pvp_instances = PvpInstance.where(:CHARACTER_NO => params[:character_no]).first

    respond_to do |format|
      format.html 
      format.json { render json: @pvp_instances } 
    end
  end

  def set 
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    @pvp_instances = PvpInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @pvp_instances == nil
      return error("invalid character_no : " + params[:character_no], 100016)
    end 
     
    @pvp_instances.CHARACTER_LV = @character.LEVEL
    @pvp_instances.COSTUME_ID = @character.COSTUME_ID
    @pvp_instances.USER_LV = @user.USER_LV
    
    @pvp_instances.PARTY_ATTACKER = params[:party_attacker]
    @pvp_instances.PARTY_DEFENDER = params[:party_defender]
    
    @pvp_instances.ATTACKER_POWER = params[:attacker_power]
    @pvp_instances.DEFENDER_POWER = params[:defender_power]
    
    @pvp_instances.save
    
    log_to_db("PVP_TEAM_SETTING", @pvp_instances.to_json, @user, @character)
    
    message("update success pvp", 0)    
  end
  
  def nomercy 
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    #유저인스턴스에 스태미너 검증로직을 한번 거친다. 
    @user = stamina_check(@user)
    
    if @user.STAMINA_PVP < params[:need_stamina].to_i
      return error("not enough stamina " + params[:user_no], 100054)
    end
     
    if @user.STAMINA_PVP == 5
      @user.STAMINA_PVP_TIME = Time.now            
    end
     
    @user.STAMINA_PVP -= params[:need_stamina].to_i
    @user.save
    
    @pvp_instances = PvpInstance.where(:CHARACTER_NO => params[:character_no]).first
    
    if @pvp_instances == nil
      return error("invalid character no : " + params[:character_no], 100016) 
    end
    
    @pvp_instances.CUR_MATCH_NO = params[:cur_match_no] 
    @pvp_instances.SEASON_NUM = params[:season_num]
    @pvp_instances.save 
    
    result = Hash.new
    add_result(result, "PVP", @pvp_instances)
    add_result(result, "USER", @user)
    
    respond_to do |format|
      format.html 
      format.json { render json: result }
    end
  end
    
  def find_by_rating(min, max, user_no)
        
    count = PvpInstance.where("#{column_name("RATING")} >= #{min} and #{column_name("RATING")} <= #{max} and #{column_name("USER_NO")} != #{user_no} and #{column_name("CHARACTER_NO")} != #{-1}").count
    if count < 1
      count = 1
    end 
    offset = rand(count)
    @pvp_instance = PvpInstance.where("#{column_name("RATING")} >= #{min} and #{column_name("RATING")} <= #{max} and #{column_name("USER_NO")} != #{user_no} and #{column_name("CHARACTER_NO")} != #{-1}").offset(offset).first      
    
    if @pvp_instance == nil   
      count = PvpInstance.where("#{column_name("USER_NO")} != #{user_no} and #{column_name("CHARACTER_NO")} != #{-1}").count    
      offset = rand(count)
      @pvp_instance = PvpInstance.where("#{column_name("USER_NO")} != #{user_no} and #{column_name("CHARACTER_NO")} != #{-1}").offset(offset).first
    end  
    
    return @pvp_instance
  end
  
  def find_by_rating_compare(value, compare, user_no) 
     
    count = PvpInstance.all.count / 500 
    if count < 1
      count = 1
    end 
    
    offset = rand(count)
    
    return PvpInstance.where("#{column_name("RATING")} #{compare} #{value} and #{column_name("USER_NO")} != #{user_no} and #{column_name("CHARACTER_NO")} != #{-1}").offset(offset).first      
  end
  
  def search
           
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    @pvp_instance = PvpInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @pvp_instance == nil
      return error("invalid character_no : " + params[:character_no], 100016)
    end 
   
    if params[:is_refresh] == "True"  
      refresh_cost = params[:refresh_cost].to_i 
      if @user.MONEY >= refresh_cost 
        @user.MONEY -= refresh_cost
        @user.save
      else
        return message("not enough gold", 100045)
      end     
    end

    result = Hash.new
        
    strong = @pvp_instance.RATING + rand(@pvp_instance.RATING*0.2..@pvp_instance.RATING*0.4)
    #middle = rand(2) == 0 ? @pvp_instance.RATING + rand(@pvp_instance.RATING*0.2) : @pvp_instance.RATING - rand(@pvp_instance.RATING*0.2)
    
    middle_high = @pvp_instance.RATING + rand(@pvp_instance.RATING*0.2)
    middle_low = @pvp_instance.RATING - rand(@pvp_instance.RATING*0.2)
    
    weak = @pvp_instance.RATING - rand(@pvp_instance.RATING*0.2..@pvp_instance.RATING*0.4)    

    all_db_count = PvpInstance.all.count 
    
    #===================강자=================
    @strong_pvp_instance = find_by_rating_compare(strong, ">", params[:user_no])
    if @strong_pvp_instance == nil
      @strong_pvp_instance = find_by_rating(middle_high, strong, params[:user_no])
    end
          
    if @strong_pvp_instance != nil
      result[result.length] = @strong_pvp_instance
    end

    #===================중자=================
    @middle_pvp_instance = find_by_rating(middle_low, middle_high, params[:user_no]) 
    
    loop_count = 0 
    until @middle_pvp_instance != @strong_pvp_instance do 
      
      @middle_pvp_instance = find_by_rating(middle_low, middle_high, params[:user_no])
      loop_count += 1
      if loop_count > all_db_count
        break
      end      
    end 
    
    if @middle_pvp_instance != nil
      result[result.length] = @middle_pvp_instance
    end
    
    #===================약자=================
    @weak_pvp_instance = find_by_rating_compare(weak, "<", params[:user_no])
    if @weak_pvp_instance == nil
      @weak_pvp_instance = find_by_rating(weak, middle_low, params[:user_no])
    end

    loop_count = 0 
    until (@weak_pvp_instance != @strong_pvp_instance) && (@weak_pvp_instance != @middle_pvp_instance) do 
   
      @weak_pvp_instance = find_by_rating(weak, middle_low, params[:user_no])
      loop_count += 1
      if loop_count > all_db_count
        break
      end      
    end 
    
    if @weak_pvp_instance != nil
      result[result.length] = @weak_pvp_instance
    end

    #===================끄읕=================

    log_to_db("PVP_MATCH_SEARCH", @pvp_instance.to_json, @user, @character)

    respond_to do |format|
      format.html 
      format.json { render json: result }
    end    

  end

  def change
  end
  
  def result
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end
    
    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first     
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end
    
    @pvp_instances = PvpInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @pvp_instances == nil
      return error("invalid character_no : " + params[:character_no], 100016)
    end 
    
    cur_match_no = @pvp_instances.CUR_MATCH_NO
    @cur_match_pvp_instances = PvpInstance.where(:CHARACTER_NO => cur_match_no).first
    
    if @cur_match_pvp_instances == nil
      return error("invalid character_no : " + cur_match_no, 100016)
    end
    
    #상대방의 전투력과 레이팅에따라 점수지급이 달라진다
    my_rating = @pvp_instances.RATING
    cur_match_rating = @cur_match_pvp_instances.RATING
    
    sub_rating = (cur_match_rating - my_rating) / 10
  
    if sub_rating > 20
      sub_rating = 20
    end   
    if sub_rating < -20
      sub_rating = -20
    end 
  
    # 패배시 0점 이상이면 미반영 
    if params[:battle_result] == "LOSE" && sub_rating > 0
      sub_rating = 0
    end
    
    my_power = @pvp_instances.ATTACKER_POWER
    cur_match_power = @cur_match_pvp_instances.DEFENDER_POWER
       
    sub_power = (cur_match_power.to_i - my_power.to_i) / 10
    
    if sub_power > 20
      sub_power = 20
    end   
    
    if sub_power < -20
      sub_power = -20
    end
    
    # 패배시 0점 이상이면 미반영
    if params[:battle_result] == "LOSE" && sub_power > 0
      sub_power = 0
    end
          
    add_rating = 0    
    succession = 0
       
    if params[:battle_result] == "WIN"
      if @pvp_instances.IS_SUCCESSION_VICTORY == "true"
        @pvp_instances.SUCCESSION_COUNT += 1
      
      else  
        @pvp_instances.IS_SUCCESSION_VICTORY = "true"
        @pvp_instances.SUCCESSION_COUNT = 1        
      
      end        
      #기본 승리시 얻는 점수
      add_rating += 20
      
      #연승시 얻는 점수 10승 이상은 10으로 친다.      
      succession = @pvp_instances.SUCCESSION_COUNT
      if succession > 10
        succession = 10
      end
            
      @pvp_instances.VICTORY_COUNT += 1
        
    elsif params[:battle_result] == "LOSE"
      if @pvp_instances.IS_SUCCESSION_VICTORY == "true"
        @pvp_instances.IS_SUCCESSION_VICTORY = "false"
        #연패 수는 기록하지 않음
        @pvp_instances.SUCCESSION_COUNT = 0           
      end
           
      #기본 패배시 얻는 점수     
      add_rating -= 10     
      
      @pvp_instances.DEFEAT_COUNT += 1
                          
    else
      return error("invalid result")       
    end
            
    add_rating += sub_rating            
    add_rating += sub_power
    
    #위의 계산식대로는 승리했으나 점수가 음수일때도 있다. 최소 10점을 주도록 하자
    if params[:battle_result] == "WIN" && add_rating < 10 
      add_rating = 10
    end
    
    add_rating += 4 * succession
                 
    @pvp_instances.RATING += add_rating
    @pvp_instances.save  
     
    #대전기록 인스턴스 생성
    @pvp_record_instances = PvpRecordInstance.new(:PVP_RECORD_INSTANCE_NO => sequence("pvp_record_instances"), :SEASON_NUM => params[:season_num], :CHARACTER_NO => params[:character_no],
                                                  :RESULT => params[:battle_result], :RESULT_TIME => Time.now.utc, :ADD_RATING => add_rating, 
                                                  :RESULT_RATING => @pvp_instances.RATING, :MATCH_CHARACTER_NO => params[:match_chr_no],
                                                  :MATCH_CHR_LV => params[:match_chr_lv], :MATCH_CHR_ID => params[:match_chr_id], :MATCH_USER_NICKNAME => params[:match_user_nickname],
                                                  :MATCH_USER_LV => params[:match_user_lv], :MATCH_CHR_DEF_POWER => params[:match_chr_def_power],
                                                  :MATCH_MONSTER_ID => params[:match_party_id], :MATCH_MONSTER_LV => params[:match_party_lv])
                                                  
    @pvp_record_instances.save
    
    ranking(@pvp_instances.RATING, params[:character_no])
    
    if @pvp_instances.IS_SUCCESSION_VICTORY == "true"
      log_to_db("PVP_MATCH_WIN", @pvp_instances.to_json, @user, @character)
    else
      log_to_db("PVP_MATCH_LOSE", @pvp_instances.to_json, @user, @character)
    end
    
    respond_to do |format|
      format.html 
      format.json { render json: @pvp_instances }
    end  
  end 
  
  def ranking(rating, chr_no)
    store_max = 100
     
    pvp_range_count = PvpRange.count  
    if pvp_range_count == 0
      return error("not available data. PVP_RANGE")
    end
    
    pvp_range_index = pvp_range_count
     
    for n in 1...pvp_range_count   
      pvp_range = PvpRange.where(:PVP_RANGE_ID => n).first
      
      if rating >= pvp_range.RATING
        pvp_range_index = n
        break
      end 
    end
    
    #1번 인덱스가 아니라면 fake
    if pvp_range_index != 1
      @pvp_range = PvpRange.where(:PVP_RANGE_ID => pvp_range_index).first
      @pre_pvp_range = PvpRange.where(:PVP_RANGE_ID => (pvp_range_index - 1)).first
      
      #전 id의 레이팅과의 차이를 현 랭크에 더한다
      sub_rating = @pre_pvp_range.RATING - rating
      rank = @pvp_range.RANK + (sub_rating * @pvp_range.ADD_RANK)
      
      @pvp_instance = PvpInstance.where(:CHARACTER_NO => chr_no).first
      if @pvp_instance == nil
        return error("not found pvp instance : " + chr_no)
      end 
      
      @pvp_instance.RANK = rank
      @pvp_instance.save
      
    # 1번 인덱스라면 랭커가 될 요건을 검사한후 정렬한다.      
    else              
      @pvp_top_rankers = PvpRankCacheInstance.all
                                    
      if @pvp_top_rankers.count < store_max  
        
        #랭커가 꽉 차있지 않으므로 그냥 이름 올림   
        rank_in(rating, chr_no)
                               
      else     
        #랭커가 꽉 차있다. 
        #순위순 정렬
        @pvp_top_rankers_sort = @pvp_top_rankers.to_a
        @pvp_top_rankers_sort = @pvp_top_rankers_sort.sort { |x, y| x.RANK <=> y.RANK }  
        
        #마지막 등수의 점수
        last_chr = @pvp_top_rankers_sort.last
        last_rating = last_chr.RATING
        
        #내가 랭크 안에 들수 있나?
        if rating >= last_rating
           
          rank_in(rating, chr_no)
          
          #순위밖 애들은 삭제.
          @unrank = PvpRankCacheInstance.where(:RANK => (store_max + 1)) 
          @unrank.each() do |delete|
            delete.destroy
          end  
                    
        #내가 랭크 안에 들 요건이 되지 않는다.
        else
          
          #혹시 내가 있나? 그렇다면 갱신
          @me = PvpRankCacheInstance.where(:CHARACTER_NO => chr_no).first
          if @me != nil
            
            rank_in(rating, chr_no)  
            #순위밖 애들은 삭제.
            @unrank = PvpRankCacheInstance.where(:RANK => (store_max + 1)) 
            @unrank.each() do |delete|
              delete.destroy
            end  
           
          else
            #점수차로 등수 선정 
            sub_rating = last_rating - rating     
            my_rank = store_max + sub_rating
          
            @pvp_instance = PvpInstance.where(:CHARACTER_NO => chr_no).first
            if @pvp_instance == nil
              return error("not found pvp instance : " + chr_no)
            end 
      
            @pvp_instance.RANK = my_rank
            @pvp_instance.save
            
          end
                  
        end # end rating >= last_rating 
                 
      end # end if @pvp_top_rankers.count == 0  
    end # end if pvp_range_index != 1     
  end # end ranking()
  
  def rank_in(rating, chr_no)
    
    @me = PvpRankCacheInstance.where(:CHARACTER_NO => chr_no).first
    if @me == nil
            
      #내가 존재하지 않는다면 생성
      @new_ranker = PvpRankCacheInstance.new(:PVP_RANK_CACHE_INSTANCE_NO => sequence("pvp_rank_cache_instances"), :RANK => 0, :CHARACTER_NO => chr_no, :RATING => rating)
      @new_ranker.save      
            
    else
      #존재한다면 점수만 갱신해줘
      @me.RATING = rating
      @me.save  
                           
    end # end if @me == nil

    #이제 전원을 점수순으로 순위를 매긴다.
    @new_pvp_top_rankers = PvpRankCacheInstance.all
    @new_pvp_top_rankers_sort = @new_pvp_top_rankers.to_a
    @new_pvp_top_rankers_sort = @new_pvp_top_rankers_sort.sort { |x, y| y.RATING <=> x.RATING }
          
    cur_rank = 0
    cur_rating = 0
    @new_pvp_top_rankers_sort.each() do |ranker|       
           
      if cur_rating != ranker.RATING
        cur_rank += 1
      end 
            
      ranker.RANK = cur_rank  
      ranker.save
      
      cur_rating = ranker.RATING
            
      #pvp instance 갱신
      @pvp_instance = PvpInstance.where(:CHARACTER_NO => ranker.CHARACTER_NO).first
      if @pvp_instance == nil
        return error("not found pvp instance" + ranker.CHARACTER_NO)
      end  
      @pvp_instance.RANK = cur_rank
      @pvp_instance.save                      
    end   
  end

  def getrecord
    
    @pvp_record_instances_all = PvpRecordInstance.where(:CHARACTER_NO => params[:character_no])
    
    if @pvp_record_instances_all == nil
      return error("not found pvp record")
    end
    
    @pvp_record_instances_season = @pvp_record_instances_all.where(:SEASON_NUM => params[:season_num])
    if @pvp_record_instances_season == nil
      return error("not found pvp record")
    end
    
    count = 10
    if @pvp_record_instances_season.count < 10
      count = @pvp_record_instances_season.count  
    end
          
    @pvp_record_instances = @pvp_record_instances_season.last(count)
    
    if @pvp_record_instances == nil
      return error("not found pvp record")
    end
    
    respond_to do |format|
      format.html 
      format.json { render json: @pvp_record_instances }
    end 
    
  end
  
  
  def getrank
  
    @ranker = PvpRankCacheInstance.all
    @ranker_sort = @ranker.to_a
    @ranker_sort = @ranker_sort.sort{ |x, y| x.RANK <=> y.RANK }    
    
    respond_to do |format|
      format.html 
      format.json { render json: @ranker_sort }
    end 
     
  end
   
  #보상 지급, 대전기록 초기화, 점수 초기화를 행한다. 
  def end_of_competition_1st
    
    @report_instance = ReportInstance.new(:REPORT_NO => sequence("report_instances"), :USER_NO => 2, :CHARACTER_NO => 0, :REPORT_TYPE => "LOG", 
                                          :VALUE => "send_reward start", :USER_LV => 0, :EXP => 0, :ACTION_TIME => Time.now, :IP => "0")
    @report_instance.save
    
    send_reward()     

    @report_instance = ReportInstance.new(:REPORT_NO => sequence("report_instances"), :USER_NO => 2, :CHARACTER_NO => 0, :REPORT_TYPE => "LOG", 
                                          :VALUE => "send_reward end", :USER_LV => 0, :EXP => 0, :ACTION_TIME => Time.now, :IP => "0")
    @report_instance.save
           
    message("대전 보상 지급 완료", 0)
                      
  end 
  
  def end_of_competition_2nd

    @report_instance = ReportInstance.new(:REPORT_NO => sequence("report_instances"), :USER_NO => 2, :CHARACTER_NO => 0, :REPORT_TYPE => "LOG", 
                                          :VALUE => "init_pvp_instances start", :USER_LV => 0, :EXP => 0, :ACTION_TIME => Time.now, :IP => "0")
    @report_instance.save
       
    clear_rank_cache()
    
    init_pvp_instances()

    @report_instance = ReportInstance.new(:REPORT_NO => sequence("report_instances"), :USER_NO => 2, :CHARACTER_NO => 0, :REPORT_TYPE => "LOG", 
                                          :VALUE => "init_pvp_instances end", :USER_LV => 0, :EXP => 0, :ACTION_TIME => Time.now, :IP => "0")
    @report_instance.save
           
    message("PVP 랭크 캐시 삭제, PVP_INSTANCE 초기화 완료", 0)  
    
  end  
  
  def send_reward()
    
    @pvp_reward_rank_type = PvpRewardInfo.where(:RANGE_TYPE => "rank") 
    
    if @pvp_reward_rank_type == nil
      return error("PvpRewardInfo 테이블에 rank 타입이 하나도 없습니다.") 
    end
    
    @pvp_reward_rank_type_last = @pvp_reward_rank_type.last
    
    @pvp_reward_percentage_type = PvpRewardInfo.where(:RANGE_TYPE => "percentage")
    
    if @pvp_reward_percentage_type == nil
      return error("pvp_reward_percentage_type 테이블에 percentage 타입이 하나도 없습니다.")
    end 
    
    # PvpRewardInfo 에서 랭크타입 보상을 받을 수 있는 최저 랭크
    rank_type_last_rank = @pvp_reward_rank_type_last.MAX
        
    #전체 대전하기 참가 인원 중에 가장 낮은 랭크
    last_rank_of_all = 0
         
    @pvp_instances = PvpInstance.all
    @pvp_join_instances = Hash.new
    
    @pvp_instances.each() do |instance|     
      battle_count = instance.VICTORY_COUNT + instance.DEFEAT_COUNT  
      if battle_count != 0
        @pvp_join_instances[instance.CHARACTER_NO] = instance
        
        if last_rank_of_all < instance.RANK
          last_rank_of_all = instance.RANK
        end
             
      end   
    end 
      
    #----------15.11.04 퍼센테이지 책정을 위한 대전하기 참가 인원은 페이크로 결정해아함 ------------ 
    #all_member_count = @pvp_join_instances.count
        
    #if all_member_count < 1
    #  return error("대전하기 참가인원이 한명도 없습니다")
    #end
    
    @pvp_range_last = PvpRange.all.last
    @pvp_range_pre_last = PvpRange.where(:PVP_RANGE_ID => @pvp_range_last.PVP_RANGE_ID - 1).first
    
    add = (@pvp_range_pre_last.RATING - @pvp_range_last.RATING) * @pvp_range_last.ADD_RANK
    
    all_member_count = @pvp_range_last.RANK + add
    
    if all_member_count < 1
      return error("PVP_RANGE 오류")
    end
     
    #--------------------------------------------------------------------------   
    
    @pvp_join_instances.each() do |key, value|  
      
      #rank 타입 보상을 받을수 있는 character들.
      if value.RANK <= rank_type_last_rank
      
        @pvp_reward_rank_type.each() do |range|
           
          if (range.MIN..range.MAX).include?(value.RANK)              
            send_mail_to_user(value.CHARACTER_NO, range.PVP_REWARD_ID, value.RANK.to_i.to_s, "PVP|RANK")     
          end 
          
        end #end @pvp_reward_rank_type.each()
                    
      end #end if value.RANK <= last_rank
       
      #별개로 전원 퍼센테이지로 보상을 주자
      rate_of_all_rank = value.RANK.to_f / all_member_count.to_f      
      rate_of_all_rank *= 100.to_f

      @pvp_reward_percentage_type.each() do |range|      
        min_range = range.MIN.to_f
        max_range = range.MAX.to_f + 1.to_f # 실제 범위는 min 이상, max + 1 미만이다.
        
        if (min_range...max_range).include?(rate_of_all_rank)
          send_mail_to_user(value.CHARACTER_NO, range.PVP_REWARD_ID, rate_of_all_rank.to_i.to_s, "PVP|UPRANK")
        end    
      end #end @pvp_reward_percentage_type.each()
             
    end #end @pvp_join_instances.each()     
      
  end
  
  
  def send_mail_to_user(chr_no, pvp_reward_id, content_rank, content_type)
     
    #GM 김성렬 번호
    gm_no = 2
    
    #메일 보관기간(일수)
    keep_date = 3
      
    @receive_character = CharacterInstance.where(:CHARACTER_NO => chr_no).first 
    if @receive_character == nil
      return error("캐릭터를 찾을수가 없습니다. 캐릭터 넘버 : " + chr_no)
    end
    receive_user_no = @receive_character.USER_NO
    
    @pvp_reward = PvpRewardInfo.where(:PVP_REWARD_ID => pvp_reward_id).first
      
    @rewards = @pvp_reward.REWARD_TYPE_AND_CAPACITY.split('|')
        
    @rewards.each() do |reward|
       
      s = reward.split('_') 
      if s.count != 2
        return error("보상이 잘못 입력되어있습니다. " + pvp_reward_id + " 번 PVP_REWARD_INFO를 찾아보세요." )
      end
      
      send_to_mail(receive_user_no, gm_no, content_type, content_rank, reward, "icon", Time.now + (60 * 60 * 24 * keep_date), content_type)
      
    end # end @rewards.each()
       
  end
  
  def clear_rank_cache 
    @pvp_rank_cache = PvpRankCacheInstance.all
    
    if @pvp_rank_cache == nil
      return error("PvpRankCacheInstance 가 비어있습니다")
    end
    
    @pvp_rank_cache.each() do |instance|
      instance.destroy  
    end
     
  end 
  
  def init_pvp_instances
    @pvp_instances = PvpInstance.all
    @pvp_instances.each do |instance|
      instance.RATING = 1000
      instance.SEASON_NUM = 0
      instance.IS_SUCCESSION_VICTORY = "false"
      instance.SUCCESSION_COUNT = 0
      instance.VICTORY_COUNT = 0
      instance.DEFEAT_COUNT = 0
      instance.RANK = 0
      
      instance.save      
    end
  end
  
  def get_period
    @pvp_periods = PvpPeriod.all
    respond_to do |format|
      format.html 
      format.json { render json: @pvp_periods }
    end
  end  
end
