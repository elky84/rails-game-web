class StatisticsController < ApplicationController

  def show(type)
    start_date, end_date = to_datestr()
    @statistics_instances = StatisticsInstance.where("#{column_name("TYPE")} = '#{type}' and #{column_name("DATE")} > '#{start_date}' and #{column_name("DATE")} < '#{end_date}'").order(:DATE)
  end

  def cu_last
    @statistics_instances = StatisticsInstance.where("#{column_name("TYPE")} = 'CU'").last(1)
    respond_to do |format|
      format.html 
      format.json { render json: @statistics_instances }
    end
  end

  def ru_last
    @statistics_instances = StatisticsInstance.where("#{column_name("TYPE")} = 'UV'").last(1)
    respond_to do |format|
      format.html 
      format.json { render json: @statistics_instances }
    end
  end

  def uv
    show("UV")
  end

  def nru
    show("NRU")
  end
  
  def first_create_character
    show("FCC")
  end

  def retention
    show("RETENTION")
  end

  def dau
    show("DAU")
  end

  def cu
    show("CU")
  end

  def dbu
    show("DBU")
  end

  def first_bu
    show("FIRST_BU")
  end
  

  def user_level_rate
    show("USER_LEVEL_GROUP")
  end
  
  def character_level_rate
    show("CHARACTER_LEVEL_GROUP")
  end
  
  def buy_shop_by_shop_id
    show("SHOP_GROUP")
  end

  def monster_by_monster_id
    show("MONSTER_GROUP")
  end  

  def item_by_item_id
    show("ITEM_GROUP")
  end  
  
  def stage_by_stage_id
    show("STAGE_GROUP")    
  end
  
  def all_diamond
    show("ALL_DIAMOND")
  end
  
  def all_money
    show("ALL_MONEY")
  end
  
  def gacha_item
    show("GACHA_ITEM")
  end

  def gacha_monster
    show("GACHA_MONSTER")
  end

  def gacha_monster_grade
    show("GACHA_MONSTER_GRADE")
  end

  def gacha_item_grade
    show("GACHA_ITEM_GRADE")
  end
  
  def log_by_user_level_rate
    show("LOG_USER_LEVEL_GROUP")
  end
  
  def pvp
    show("PVP_COUNT")
  end
  
  def pvp_rating
    show("PVP_RATING")
  end
  
  def item_enchant
    show("ITEM_ENCHANT")
  end
  
  def skill_enchant
    show("SKILL_ENCHANT")
  end
  
  def monster_enchant
    show("MONSTER_ENCHANT")
  end
  
  def monster_evolution
    show("MONSTER_EVOLUTION")
  end
  
  def summon_friend
    show("SUMMON_FRIEND")
  end
  
  def mastery
    show("MASTERY")
  end
  
  def ext_slot
    show("EXT_SLOT")
  end
  
  def buy_mastery_point
    show("MASTERY_BUY_COUNT")
  end
  
  def cash_gacha
    show("CASH_GACHA")
  end
  
  def quest
    show("QUEST_CLEAR")
  end
  
  def daily_quest
    show("DAILY_QUEST_CLEAR")
  end
  
  def stage_reward
    show("STAGE_REWARD")
  end
  
  def stage_enter
    show("STAGE_ENTER")
  end
  
  
  def record(time, type, value, info = "", user_lv = -1)
    time_str = datetime_to_str(time)
    @statistics_instances = StatisticsInstance.new(:TYPE => type, :VALUE => value, :INFO => info, :DATE => time_str, :STATISTICS_NO => sequence("statistics_instances"), :USER_LV => user_lv)
    @statistics_instances.save
  end
  
  # unique visitor -> 실시간
  def record_uv
    record(Time.now - params[:start_date].to_i.days, "UV", UserInstance.all.count)
  end

  # new recorded user -> 실시간
  def record_nru
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), UserInstance) 
    record(Time.now - params[:start_date].to_i.days, "NRU", instances.count)
  end
  
  def record_retention
    # 통계 기간     2, -1   / 5, -1
    between = params[:start_date].to_i + params[:end_date].to_i
    
    for i in 0..between
      _start = params[:start_date].to_i - i
      _end = _start - 1
      
      debug_logger(_start)
      
      _start_date = Time.now.utc - _start.days
      _end_date = Time.now.utc - _end.days

      # 금일 접속자
      now_instances = near_date_data(to_midnight(_start_date), to_midnight(_end_date), LogInstance, "created_at")
      now_instances = now_instances.select(:USER_NO).distinct
      
      _start -= 1
      _end -= 1
      
      debug_logger(_start)
      
      _start_date = Time.now.utc - _start.days
      _end_date = Time.now.utc - _end.days
      
      yest_instances = near_date_data(to_midnight(_start_date), to_midnight(_end_date), LogInstance, "created_at")
      yest_instances = yest_instances.select(:USER_NO).distinct!
      
      count = 0
      yest_instances.each do |user|
        now_user = now_instances.where(:USER_NO => user.USER_NO)
        if now_user != nil
          count += 1
        end
      end
      
      record(Time.now - (_start + 1).days, "RETENTION", count)
    end
    
  end

  # daily active user -> 실시간
  def record_dau
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days

    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), UserInstance, "updated_at") 
    record(Time.now - params[:start_date].to_i.days, "DAU", instances.count)
  end

  # current user -> 실시간
  def record_cu
    instances = near_date_data(Time.now.utc - 1.hours, Time.now.utc, UserInstance, "updated_at")
    record(Time.now, "CU", instances.count)
  end

  def record_first_bu
    
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'FIRST_BU'") 
    record(Time.now - params[:start_date].to_i.days, "FIRST_BU", instances.count)
  end

  def record_dbu
    
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'CHARGE_DIAMOND'").select("DISTINCT #{column_name("USER_NO")}") 
    record(Time.now - params[:start_date].to_i.days, "DBU", instances.count)
  end  
  
  def select_statement(column)
    if Rails.env.development?
      return "COUNT(*) AS COUNT, #{column}"
    else
      return "COUNT(*) AS \"COUNT\", \"#{column}\""
    end
  end
  
  def record_user_level_rate
    now = Time.now - params[:start_date].to_i.days
    UserInstance.all.group("USER_LV").select(select_statement("USER_LV")).each do |instance|
      record(now, "USER_LEVEL_GROUP", instance.COUNT, instance.USER_LV)
    end
  end
  
  def record_character_level_rate
    now = Time.now - params[:start_date].to_i.days
    CharacterInstance.all.group("LEVEL").select(select_statement("LEVEL")).each do |instance|
      record(now, "CHARACTER_LEVEL_GROUP", instance.COUNT, instance.LEVEL)
    end
  end
  
  def record_item_by_item_id
    # 등급별 기록도 추가
    now = Time.now - params[:start_date].to_i.days
    ItemInstance.all.group("ITEM_ID").select(select_statement("ITEM_ID")).each do |instance|
      record(now, "ITEM_GROUP", instance.COUNT, instance.ITEM_ID)
    end
  end

  def record_monster_by_monster_id
    now = Time.now - params[:start_date].to_i.days
    MonsterInstance.all.group("MONSTER_ID").select(select_statement("MONSTER_ID")).each do |instance|
      record(now, "MONSTER_GROUP", instance.COUNT, instance.MONSTER_ID)
    end
  end
  
  def record_stage_by_stage_id
    now = Time.now - params[:start_date].to_i.days
    hash = Hash.new

    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'STAGE_CLEAR'")
    
    instances.each do |instance|
      h = JSON.parse(instance.VALUE)
      stage_id = h["STAGE_ID"] 

      increase_count(hash, stage_id)

    end

    hash.each do |key, value|
      record(now, "STAGE_GROUP", value, key)
    end
  end
  
  def record_buy_shop_by_shop_id
    now = Time.now - params[:start_date].to_i.days
    hash = Hash.new

    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'SHOP_BUY'")
    
    instances.each do |instance|
      h = JSON.parse(instance.VALUE)
      shop_item_id = h["SHOP_ITEM_ID"] 

      increase_count(hash, shop_item_id)
    end

    hash.each do |key, value|
      record(now, "SHOP_GROUP", value, key)
    end
  end

  def record_gacha
    now = Time.now - params[:start_date].to_i.days
    
    hash_item = Hash.new
    hash_item_grade = Hash.new

    hash_monster = Hash.new    
    hash_monster_grade = Hash.new
    
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days

    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'GACHA'")
    
    instances.each do |instance|
      h = JSON.parse(instance.VALUE)
      reward = h["SELECT_REWARD"]
      
      str = reward.split("_")
      if str[0] == "I"
        @item_info = ItemInfo.where(:ITEM_ID => str[1]).first
        if @item_info != nil
          grade = @item_info.GRADE
          reward = "[" + reward + "]" + @item_info.NAME
        end
        
        increase_count(hash_item, reward)
        increase_count(hash_item_grade, grade)
        
      elsif str[0] == "M"
        @monster_info = MonsterInfo.where(:MONSTER_ID => str[1]).first
        if @monster_info != nil
          @actor_status_script = ActorStatusScript.where(:index => @monster_info.ACTOR_ID).first
          if @actor_status_script != nil
            grade = @monster_info.MONSTER_GRADE
            reward = "[" + reward + "]" + @actor_status_script.actor_name 
          end
        end
        
        increase_count(hash_monster, reward)
        increase_count(hash_monster_grade, grade)
      end
    end

    hash_item.each do |key, value|
      record(now, "GACHA_ITEM", value, key)
    end
    
    hash_item_grade.each do |key, value|
      record(now, "GACHA_ITEM_GRADE", value, key)
    end

    hash_monster.each do |key, value|
      record(now, "GACHA_MONSTER", value, key)
    end
    
    hash_monster_grade.each do |key, value|
      record(now, "GACHA_MONSTER_GRADE", value, key)
    end

  end
  
  # 전체 대전 횟수 / 대전 승 / 대전 패  
  def record_pvp
    now = Time.now - params[:start_date].to_i.days

    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days

    instances_win = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'PVP_MATCH_WIN'")
    instances_lose = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'PVP_MATCH_LOSE'")
    
    record(now, "PVP_COUNT", instances_win.count, "WIN")
    record(now, "PVP_COUNT", instances_lose.count, "LOSE")
  end
  
  # PVP 점수별 분포 [100단위]. 최상위 100명은 따로 볼 수 있게 지원.
  def record_pvp_rating
    now = Time.now - params[:start_date].to_i.days
    hash = Hash.new

    instances = PvpInstance.all
    instances.each do |instance|
      n = instance.RATING / 100
      
      increase_count(hash, n)
    end
    
    hash.each do |key, value|
      record(now, "PVP_RATING", key, (value.to_i * 100))
    end
  end
  
  def record_item_enchant
    now = Time.now - params[:start_date].to_i.days
    
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    hash = Hash.new
    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'ITEM_ENCHANT'")
    instances.each do |instance|
      h = JSON.parse(instance.VALUE)

      increase_count(hash, h["ENCHANT_VALUE"])
    end
    
    hash.each do |key, value|
      record(now, "ITEM_ENCHANT", value, key)
    end
  end


  def record_skill_enchant
    now = Time.now - params[:start_date].to_i.days
    
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    hash = Hash.new
    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'SKILL_ENCHANT'")
    instances.each do |instance|
      h = JSON.parse(instance.VALUE)

      increase_count(hash, h["ENCHANT_VALUE"])
    end
    
    hash.each do |key, value|
      record(now, "SKILL_ENCHANT", value, key)
    end    
  end

  def record_monster_enchant
    now = Time.now - params[:start_date].to_i.days
    
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    hash = Hash.new
    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'MONSTER_ENCHANT'")
    instances.each do |instance|
      h = JSON.parse(instance.VALUE)

      increase_count(hash, h["ENCHANT_VALUE"])
    end
    
    hash.each do |key, value|
      record(now, "MONSTER_ENCHANT", value, key)
    end    
  end
  
  def record_monster_evolution
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    record(Time.now - params[:start_date].to_i.days, "MONSTER_EVOLUTION", near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'MONSTER_EVOLUTION'").count, "COUNT")    
  end

  def record_summon_friend  
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    record(Time.now - params[:start_date].to_i.days, "SUMMON_FRIEND", near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'SUMMON_FRIEND'").count, "COUNT")
  end
  
  def increase_count(hash, key)
    if hash[key] == nil
      hash[key] = 0
    end
    
    hash[key] += 1
  end
  
  def record_mastery
    now = Time.now - params[:start_date].to_i.days
    hash = Hash.new

    instances = MasteryInstance.all
    instances.each do |instance|
      mastery = instance.MASTERY.split("|")
      mastery.each do |str|
        if str.include? "ATTACK"
          increase_count(hash, "ATTACK")
        elsif str.include? "DEFENCE"
          increase_count(hash, "DEFENCE")
        elsif str.include? "UTILITY"
          increase_count(hash, "UTILITY")
        end
      end
    end
    
    hash.each do |key, value|
      record(now, "MASTERY", value, key)
    end
  end
  
  # 요괴/아이템
  def record_ext_slot
    now = Time.now - params[:start_date].to_i.days

    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days


    record(now, "EXT_SLOT", near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'EXT_SLOT_PARTY'").count, "PARTY")
    record(now, "EXT_SLOT", near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'EXT_SLOT_EQUIP'").count, "EQUIP")
  end
  
  # 특성 포인트 구매
  def record_buy_mastery_point
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    record(Time.now - params[:start_date].to_i.days, "MASTERY_BUY_COUNT", near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'MASTERY_BUY_COUNT'").count, "COUNT")
  end
  
  # 요괴/장비
  def record_cash_gacha
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days

    record(Time.now - params[:start_date].to_i.days, "CASH_GACHA", near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'CASH_GACHA'").count, "COUNT")
  end
  
  # 임무 진행 횟수
  def record_quest
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days

    record(Time.now - params[:start_date].to_i.days, "QUEST_CLEAR", near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'QUEST_CLEAR'").count, "COUNT")
  end

  # 일간 임무 체크 [20005 or 20011]. 쌓는 코드에서 검사.
  def record_daily_quest
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days

    record(Time.now - params[:start_date].to_i.days, "DAILY_QUEST_CLEAR", near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'DAILY_QUEST_CLEAR'").count, "COUNT")
  end

  # 아이템/요괴 통합
  def record_stage_reward
    now = Time.now - params[:start_date].to_i.days
    hash = Hash.new

    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days

    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'STAGE_REWARD'")
    instances.each do |instance|
      h = JSON.parse(instance.VALUE)
      
      stage_id = h["STAGE_ID"]
      if hash[stage_id] == nil
        hash[stage_id] = Hash.new
      end
      
      clear_reward = h["CLEAR_REWARD"].split(",")
      clear_reward.each do |reward|
        name = nil
        str = reward.split("_")
        if str[0] == "I"
          @item_info = ItemInfo.where(:ITEM_ID => str[1]).first
          if @item_info != nil
            grade = @item_info.GRADE
            name = "[" + reward + "]" + "_" + @item_info.NAME
          end
          
        elsif str[0] == "M"
          @monster_info = MonsterInfo.where(:MONSTER_ID => str[1]).first
          if @monster_info != nil
            @actor_status_script = ActorStatusScript.where(:index => @monster_info.ACTOR_ID).first
            if @actor_status_script != nil
              grade = @monster_info.MONSTER_GRADE
              name = "[" + reward + "]" + "_" + @actor_status_script.actor_name
            end
          end
        else
          next
        end
        
        if hash[stage_id][name] == nil
          hash[stage_id][name] = 0
        end
        
        hash[stage_id][name] += 1
      end
    end
    
    hash.each do |stage_id, value|
      value.each do |name, count|
        record(now, "STAGE_REWARD", stage_id, name.to_s + "_" + count.to_s)
      end
    end
  end
  
  # 시도 횟수   
  def record_stage_enter
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days

    record(Time.now - params[:start_date].to_i.days, "STAGE_ENTER", near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at", "#{column_name("LOG_TYPE")} = 'STAGE_ENTER'").count, "COUNT")
  end
  
  def record_all_diamond
    record(Time.now - params[:start_date].to_i.days, "ALL_DIAMOND", UserInstance.sum(:CASH))
  end
  
  def record_all_money
    record(Time.now - params[:start_date].to_i.days, "ALL_MONEY", UserInstance.sum(:MONEY))    
  end    
  
  def record_log_by_user_level_rate
    start_date = Time.now.utc - params[:start_date].to_i.days
    end_date = Time.now.utc + params[:end_date].to_i.days
    
    instances = near_date_data(to_midnight(start_date), to_midnight(end_date), LogInstance, "created_at")
    now = Time.now - params[:start_date].to_i.days
    
    hash_log = Hash.new
    instances.each do |instance|
      if hash_log[instance.USER_LV] == nil
        hash_log[instance.USER_LV] = Hash.new
      end
      
      if hash_log[instance.USER_LV][instance.LOG_TYPE] == nil
        hash_log[instance.USER_LV][instance.LOG_TYPE] = 0
      end
      
      hash_log[instance.USER_LV][instance.LOG_TYPE] += 1
    end
    
    hash_log.each do |user_lv, value|
      value.each do |type, count|
        record(now, "LOG_USER_LEVEL_GROUP", count, type, user_lv)
      end
    end
  end
  
end