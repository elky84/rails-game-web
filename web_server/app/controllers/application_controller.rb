require 'base64'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery
  
  def column_name(name)
    if Rails.env.development?
      return name
    else
      return "\"#{name}\""
    end
  end 
  
  def encrypt(str)
    return Base64.encode64(str)
  end
  
  def decrypt(enc)
    return Base64.decode64(enc)
  end
  
  def auth_check
    auth_instance = AuthInstance.where(:USER_NO => params[:user_no]).first
    if auth_instance == nil
      return error("not find auth_instance. " + params[:user_no].to_s, 110000)
    end
    
    if auth_instance.AUTH_KEY != params[:auth_key]
      return error("invalid auth_key : " + params[:auth_key].to_s + " auth_instance.auth_key : " + auth_instance.AUTH_KEY + " user_no :" + params[:user_no].to_s, 110002)      
    end
    
    notice_instance = NoticeInstance.where("#{column_name("START_DATE")} < '#{Time.now.utc}' AND #{column_name("END_DATE")} > '#{Time.now.utc}' AND #{column_name("NOTICE_TYPE")} = 'MAINTENANCE'").first
    if notice_instance != nil
      user_instance = UserInstance.where(:USER_NO => params[:user_no]).first
      if user_instance == nil || user_instance.PERMISSION == 'USER'
        return error("now maintenance mode.", 558)
      end
    end
    
    return true
  end

  def ip_check
    @remote_ip = request.remote_ip.encode('utf-8')
    if Rails.env.development?
      return true
    else
      if "106.251.53.134" != @remote_ip && "211.192.197.103" != @remote_ip && @remote_ip[0, 8] != "192.168."
        logger.error("invalid ip. remote_ip: " + @remote_ip)
        head(403)
        return false
      end    
    end       
    return true
  end
   
   
  def error(msg, code)
    respond_to do |format|
      format.html
      format.json { render json: { "contents_error" => msg, "code" => code }.to_json }
    end
    
    logger.error("contents_error:" + msg + " code:" + code.to_s + " caller:" + caller[0].to_s + " request_params : " + request.path_parameters.to_s + " query_params : " + request.query_parameters.to_s)
    return false
  end
  
  def retry(msg, code)
    respond_to do |format|
      format.html
      format.json { render json: { "retry" => msg, "code" => code }.to_json }
    end
    
    logger.info("retry:" + msg + " code:" + code.to_s + " caller:" + caller[0].to_s + " request_params : " + request.path_parameters.to_s + " query_params : " + request.query_parameters.to_s)
    return false
  end
  
  def message(msg, code)
    respond_to do |format|
      format.html
      format.json { render json: { "message" => msg, "code" => code }.to_json }
    end
    logger.info("message:" + msg + " code:" + code.to_s + " caller:" + caller[0].to_s + " request_params : " + request.path_parameters.to_s + " query_params : " + request.query_parameters.to_s)
    return false
  end
  
  def invalid_version(msg, code)
    respond_to do |format|
      format.html
      format.json { render json: { "invalid_version" => msg, "code" => code }.to_json }
    end
    logger.info("invalid_version:" + msg + " code:" + code.to_s + " caller:" + caller[0].to_s + " request_params : " + request.path_parameters.to_s + " query_params : " + request.query_parameters.to_s)
    return false
  end

  def sequence(table)
    if Rails.env.development?
      @nextid = ActiveRecord::Base.connection.execute("select * from sqlite_sequence where name = '#{table}'").first
      if @nextid == nil
        return 1
      else
        return @nextid['seq'] + 1
      end
    else
      @nextid = ActiveRecord::Base.connection.execute("select nextval('#{table}_id_seq')").first
      return @nextid['nextval']
    end
  end
  
  def create_or_update(key)
    hash = params.to_unsafe_h
    hash.delete("action")
    hash.delete("controller")
    hash.delete("format")
    
    model = controller_path.classify.constantize
    
    instance = nil    
    hash.each do |h|
      name = h[0].to_s
      if name.include? controller_name.singularize.to_s
        param = h[1]
        instance = model.where(key => param[key.to_s]).first
        if instance == nil
          instance = model.new(param)
          sequence(controller_name.to_s)
          instance.save
        else
          instance.update(param)
        end
      end
    end
        
    # 여러개를 처리하고 하나만 반환하면, response에 한개만 전달 되지만, upload기능엔 문제가 없기에 이렇게 수정.
    return instance
  end
  
  def nickname_to_user_no(nickname)
    @user_instance = UserInstance.where(:NICKNAME => nickname).first
    if @user_instance == nil
      return nil
    end
    
    return @user_instance.USER_NO
  end  
  
  def nickname_like_user_instances(nickname)
    if Rails.env.development?
      return UserInstance.where("NICKNAME LIKE ?", "#{nickname}%")
    else
      return UserInstance.where("\"NICKNAME\" LIKE ?", "#{nickname}%")
    end 
  end  
  
  def item_option_composite(option_list, basic_effect)
    item_option_list = String.new
    
    str_item_option = option_list.split("|")
    str_item_option.each do |option|
      if option == "0.0" or option == "0"
        next
      end
            
      debug_logger(option)
      
      @item_option = get_item_option_info(option)
      value = calc_option_value(@item_option, basic_effect)
      
      str = @item_option.GRADE.to_s+ "_" + @item_option.DETAIL_ID.to_s + "_" + value.to_s
      item_option_list = item_option_list + str + "|"
    end
    
    if item_option_list.size != 0
      item_option_list[item_option_list.rindex("|")] = ''
    end
    
    return item_option_list  
  end
  
  def get_item_option_info(option)
    option_arr = option.split("_")
    
    grade = option_arr[0]
    if option_arr[1] == "R"
      @item_option = ItemOption.where(:GRADE => grade)
      
      loop_count = 0
      option_id = 0
      
      until false do    
        if @item_option.size <= loop_count
          return error("not find valid options. loop_count : " + loop_count)
        end 
          
        n = rand(@item_option.size)          
        option_id = @item_option[n].OPTION_ID
        @option = Option.where(:OPTION_ID => option_id).first
        if @option == nil
          return error("not found option id : " + option_id.to_s)
        end
        
        if @option.RANDON_ACTIVITY == 1
          break
        end         
        loop_count += 1 
      end
      
      detail_id = @item_option[n].DETAIL_ID
                   
    else
      detail_id = option_arr[1]
      #detail_id = option[1, option.length]
    end
     
    @item_option = ItemOption.where(:GRADE => grade, :DETAIL_ID => detail_id).first
    if @item_option == nil
      return nil
    else
      return @item_option
    end
  end
  
  def calc_option_value(item_option, basic_effect)
    if item_option == nil
      return 0
    end
    
    if basic_effect == ""
      value = rand(item_option.MIN..item_option.MAX)
    else
      value = rand(item_option.MIN..item_option.MAX)

      effects = basic_effect.split("|")
      value = apply_effect(effects, value)
    end
    
    return value
  end
  
  def apply_effect(effects, value)
    effects.each do |effect|
      n, sym = effect.split("_")
      if sym == "%"
        n = ("1.0" + n).to_f
        operator = "*"
      else
        n = n.to_f
        operator = sym
      end
      
      value = value.to_i.send(operator, n).to_f.floor.to_i
    end
    return value
  end
  
  def reward_item(user_no, reward, result)
    reward_type = reward.split("_")[0].to_s    
    reward_id = reward.split("_")[1].to_i
    
    if reward_type == "M"
      reward_type = "MONSTER"
      
      monster_id = reward_id
      @monster_info = MonsterInfo.where(:MONSTER_ID => monster_id).first
      
      if @monster_info == nil
        return error("not found monster_info", 100004)
      end
             
      @monster_instance = MonsterInstance.new(:MONSTER_NO => sequence("monster_instances"),:USER_NO => user_no, :CHARACTER_NO => 0,
       :MONSTER_ID => monster_id,:GROW_TYPE_DETAIL => @monster_info.GROW_TYPE_DETAIL, :LEVEL => 1, :EXP => 0, :SKILL => get_monster_skill(monster_id), :TEAM_SLOT => 0, :NEW => 1)
      @monster_instance.save
      result[result.length] = @monster_instance.as_json.merge("RESULT_TYPE" => reward_type)
             
    elsif reward_type == "I"
      reward_type = "ITEM"      
      item_id = reward_id
      
      @item_info = ItemInfo.where(:ITEM_ID => item_id).first
      
      if @item_info == nil
        return error("not find item_info. item_id:" + item_id.to_s, 100006)
      end
      
      enddate = "2999-12-31 23:59:59 +0900"
      if @item_info.EXPIRE_TYPE != "PERMANENT"
        enddate = Time.now + (capacity).days
      end
      
      @item_instance = ItemInstance.new(:ITEM_NO => sequence("item_instances"), :ITEM_ID => item_id, :USER_NO => user_no, :START_DATE => Time.now, :END_DATE => enddate, :EXPIRE_TYPE => "PERMANENT", :DURABILITY => 0,
        :ITEM_NAME => @item_info.NAME, :LEVEL => @item_info.LEVEL, :GRADE => @item_info.GRADE, :LIMIT => @item_info.LIMIT, :SLOT_TYPE => "INVENTORY", :ENCHANT => 0,
        :VALUE => @item_info.PRICE, :DEFAULT_OPTION => item_option_composite(@item_info.DEFAULT_OPTION, ""), :CHARACTER_NO => 0,
        :OPTION_LIST => item_option_composite(@item_info.ITEM_OPTION_LIST, "")) 
      @item_instance.save
        
      result[result.length] = @item_instance.as_json.merge("RESULT_TYPE" => reward_type)
    else
      return error("inapposite reward_type" + reward_type, 100002)
    end 
  end
  
  def max_level_monster_reward(user_no, reward, result)
    reward_type = reward.split("_")[0].to_s    
    reward_id = reward.split("_")[1].to_i
    
    if reward_type == "M"
      reward_type = "MONSTER"

      @monster_info = MonsterInfo.where(:MONSTER_ID => reward_id).first
      if @monster_info == nil
        return
      end
             
      @monster_instance = MonsterInstance.new(:MONSTER_NO => sequence("monster_instances"),:USER_NO => user_no, :CHARACTER_NO => 0,
       :MONSTER_ID => reward_id,:GROW_TYPE_DETAIL => @monster_info.GROW_TYPE_DETAIL, :LEVEL => 30, :EXP => 542310, :SKILL => get_monster_skill(reward_id), :TEAM_SLOT => 0, :NEW => 1)
      @monster_instance.save
      result[result.length] = @monster_instance.as_json.merge("RESULT_TYPE" => reward_type)
    end       
  end
  
  
  def gacha(user, result, gacha_id)
    @gacha = Gacha.where(:GACHA_ID => gacha_id).first
        
    group_ids = @gacha.GROUP_ID.split("|")
    probability = @gacha.REWARD_PROBABILITY.split("|")
 
    sum = 0
    for n in 0...probability.length
      sum += probability[n].to_f
    end
    
    if sum != 100
      return error("not enough gacha probability. gacha_id : " + @gacha.GACHA_ID.to_s, 100007)
    end
    
    random_for_gacha = rand(0.0...100.0)
    gacha_group_id = nil
    sum = 0
    for n in 0...probability.length
      sum += probability[n].to_f 
      if random_for_gacha < sum
        gacha_group_id = group_ids[n].to_f
        break
      end
    end
    
    if gacha_group_id == nil
      return error("rand : " + random_for_gacha + ", not set gacha group index.", 100008)
    end
    
    @gacha_group = GachaGroup.where(:GACHA_GROUP_ID => gacha_group_id).first 
    if @gacha_group == nil
      return error("not found group id : " + gacha_group_id.to_s, 100009)
    end
    
    group_rewards = @gacha_group.GROUP_REWARD.split("|")
        
    random_for_reward = rand(0...group_rewards.length)
    reward = group_rewards[random_for_reward]
    
    gacha_group_json = @gacha_group.as_json.merge("SELECT_REWARD" => reward).to_json
    log_to_db("GACHA", gacha_group_json, user, nil)
    
    reward_item(params[:user_no],reward, result)
  end
  
  
  def add_item(result, user, category, capacity, argument)
    if category == "GACHA"
      for n in 0...capacity
        if false == gacha(user, result, argument)
          return false
        end
      end 
    elsif category == "STAMINA_ADVENTURE"
      user.STAMINA_ADVENTURE += capacity
      add_result(result, category, capacity)
    elsif category == "STAMINA_SPECIAL"
      user.STAMINA_SPECIAL += capacity
      add_result(result, category, capacity)
    elsif category == "STAMINA_PVP"
      user.STAMINA_PVP += capacity
      add_result(result, category, capacity)
    elsif category == "GOLD"
      user.MONEY += capacity
      add_result(result, category, capacity)
    elsif category == "DIAMOND"     
      user.CASH += capacity
      add_result(result, category, capacity)
    elsif category == "FRIEND_POINT"     
      user.FRIEND_POINT += capacity
      add_result(result, category, capacity)
    elsif category == "EXP"
      @user.EXP = @user.EXP + capacity

      add_result(result, "USER_EXP", capacity)
       
      @user_grow = UserGrow.all.order(:LEVEL)
      for n in 0..@user_grow.size-1
        if @user_grow[n].REQUIRE_EXP <= @user.EXP 
          @user.USER_LV = @user_grow[n].LEVEL
        else
          break
        end
      end
      
      add_result(result, "USER_LEVEL", @user.USER_LV)
  
      argument.EXP = argument.EXP + capacity
      
      add_result(result, "CHARACTER_EXP", capacity)

      char_info = CharacterInfo.where(:CHARACTER_ID =>      argument.CHARACTER_ID).first
      
      @character_grow = CharacterGrow.where(:GROW_TYPE_DETAIL => char_info.GROW_TYPE_DETAIL).order(:LEVEL)
      for n in 0..@character_grow.size-1
        if @character_grow[n].REQUIRE_EXP <= argument.EXP 
          argument.LEVEL = @character_grow[n].LEVEL
        else
          break
        end
      end
  
      add_result(result, "CHARACTER_LEVEL", argument.LEVEL)
      
      if argument.PARTY_MONSTER_ID != "NONE"
        party_monster = argument.PARTY_MONSTER_ID.split("|")
        for n in 0...party_monster.length
          @monster = MonsterInstance.where(:MONSTER_NO => party_monster[n].to_i).first
          if @monster == nil
            next
          end
          
          @monster.EXP = @monster.EXP + capacity
          @monster_grow = MonsterGrow.where(:GROW_TYPE_DETAIL => @monster.GROW_TYPE_DETAIL).order(:LEVEL)
          for n in 0..@monster_grow.size-1
            if @monster_grow[n].REQUIRE_EXP <= @monster.EXP 
              @monster.LEVEL = @monster_grow[n].LEVEL
            else
              break
            end
          end
                                
          add_result_monster(result, "MONSTER_EXP", capacity, @monster.MONSTER_NO)
          add_result_monster(result, "MONSTER_LEVEL", @monster.LEVEL, @monster.MONSTER_NO)
  
          @monster.save
        end
      end
      
      argument.save
      @user.save
    elsif category == "MONSTER"
      monster_id = argument
      @monster_info = MonsterInfo.where(:MONSTER_ID => monster_id).first
      
      if @monster_info == nil
        return error("not found monster_info" + monster_id, 100010)
      end
             
      @monster_instance = MonsterInstance.new(:USER_NO => params[:user_no], :MONSTER_NO => sequence("monster_instances"), :CHARACTER_NO => 0,
       :MONSTER_ID => monster_id,:GROW_TYPE_DETAIL => @monster_info.GROW_TYPE_DETAIL, :LEVEL => 1, :EXP => 0,  :SKILL => get_monster_skill(monster_id),:TEAM_SLOT => 0, :NEW => 1)

      @monster_instance.save
      result[result.length] = @monster_instance.as_json.merge("RESULT_TYPE" => category)
    elsif category == "ITEM" || category == "COSTUME"
      @item_info = ItemInfo.where(:ITEM_ID => argument).first
      if @item_info == nil
        return error("not find item_info. item_id:" + argument.to_s, 100011)
      end

      slot_type = "INVENTORY"
      if @item_info.DEFAULT_OPTION.split("_")[0] == "MONTH" || @item_info.ITEM_OPTION_LIST.split("_")[0] == "MONTH"
        slot_type = "HIDE"
        
        check_item = ItemInstance.where(:USER_NO => user.USER_NO, :ITEM_ID => @item_info.ITEM_ID).first
        if nil != check_item
          return error("duplicated item. item_id:" + @item_info.ITEM_ID.to_s, 100083)
        end
      end
      
      enddate = "2999-12-31 23:59:59 +0900"
      if @item_info.EXPIRE_TYPE != "PERMANENT"
        enddate = Time.now + (24 * 60 * 60 * capacity)
      end
      
      @item_instance = ItemInstance.new(:ITEM_NO => sequence("item_instances"), :ITEM_ID => argument, :USER_NO => user.USER_NO, :START_DATE => Time.now, :END_DATE => enddate, :EXPIRE_TYPE => @item_info.EXPIRE_TYPE, :DURABILITY => 0,
        :ITEM_NAME => @item_info.NAME, :LEVEL => @item_info.LEVEL, :GRADE => @item_info.GRADE, :LIMIT => @item_info.LIMIT, :SLOT_TYPE => slot_type, :ENCHANT => 0,
        :VALUE => @item_info.PRICE, :DEFAULT_OPTION => item_option_composite(@item_info.DEFAULT_OPTION, ""), :CHARACTER_NO => 0,
        :OPTION_LIST => item_option_composite(@item_info.ITEM_OPTION_LIST, "")) 
        
      if @item_info.DEFAULT_OPTION.split("_")[0] == "MONTH" || @item_info.ITEM_OPTION_LIST.split("_")[0] == "MONTH"
        if false == daily_flatrate(user.USER_NO, @item_instance)
          return false
        end  
      end

      @item_instance.save            
      result[result.length] = @item_instance.as_json.merge("RESULT_TYPE" => category)
    else
      return error("inapposite reward_type" + result + " " + user + " " + category + " " + capacity + " " + argument , 100012)
    end 
  end
  
  
  def send_to_mail(user_no,sender_no,title,content,reward,icon,end_date,mail_type)
    @user = UserInstance.where(:USER_NO => user_no).first
    if @user == nil
      return error("not find user." + user_no, 100013)
    end
    
    @sender = UserInstance.where(:USER_NO => sender_no).first
    if @sender == nil
      return error("not find send user." + sender_no, 100014)
    end
    
    reward_count = reward.to_s.split("|").count
    
    opened = ""
    for n in 0...reward_count
      opened << "0"
      if n != reward_count - 1
        opened << "|"
      end
    end

    @character_info = CharacterInfo.where(:CHARACTER_ID => @sender.LASTEST_CHR_ID).first
    if @character_info == nil
      return error("invalid character_info:" + @sender.LASTEST_CHR_ID, 100016)
    end
    
    @actor_status_script = ActorStatusScript.where(:index => @character_info.ACTOR_ID).first
    if @actor_status_script == nil
      return error("invalid character_info:" + @character_info.ACTOR_ID.to_s + " " + params[:user_no], 100018)
    end
    
    @send_mail_instance = MailInstance.new( :USER_NO => user_no.to_i, :MAIL_NO => sequence("mail_instances"),
    :TITLE => title.to_str, :CONTENT => content.to_str,:REWARD => reward.to_str,
     :SENDER =>  @sender.NICKNAME.to_str,:SENDER_ACTOR_ID=> @actor_status_script.index,:SENDER_USER_NO => sender_no.to_i, :OPENED => opened.to_str,:END_DATE => end_date, :MAIL_TYPE => mail_type)
     
    @send_mail_instance.save
  end
  
  def get_monster_skill(monster_id)
    @monster_info = MonsterInfo.where(:MONSTER_ID => monster_id).first
      
    if @monster_info == nil
        return error("not found monster_info", 100004)
    end
            
    @actor_status_script = ActorStatusScript.where(:index => @monster_info.ACTOR_ID).first
    if @actor_status_script == nil
      return error("invalid @actor_status_script: " + @actor_status_script, 100018)
    end
    
    skill = @actor_status_script.skill_list    
    
    # 엑터에 랜덤 스킬 가져오기
    random_skill = @actor_status_script.random_skill_list.split("|")
    random_percent = @actor_status_script.random_skill_percent.split("|")
    
    if(random_skill.count != random_percent.count)
       return error("invalid @actor_status_script: " + @actor_status_script.to_s + "random_skill invalid", 100018)
    end
      
    hash = Hash.new  
   
    for n in 0 ... random_skill.count
       hash[random_skill[n]] = random_percent[n]
    end
    random_skill_arr = hash.to_a
    random_skill_arr = random_skill_arr.sort { |x, y| x[1] <=> y[1] } 

    hash = Hash.new
    for n in 0 ... random_skill_arr.count
      random_for_percent = rand(0..100)
      
      if(random_percent[n].to_f > random_for_percent)
        hash[random_skill[n]] = random_percent[n]
      end
      
    end
    
    empty_skill_count = 4 - @actor_status_script.skill_list.split("|").count     
    for n in 0 ... empty_skill_count
      
      if(n > hash.count - 1)
        break;
      end

      skill << "|" + hash.to_a[n][0].to_s
       debug_logger(skill)
    end   

    return skill
  end
  
  def reward_parsing(reward, argument = nil)
    reward_type = reward.split("_")[0].to_s    
    reward_value = reward.split("_")[1].to_i
    if reward_type == "M"
      reward_type = "MONSTER"
      argument = reward_value
    elsif reward_type == "I"
      reward_type = "ITEM"
      argument = reward_value
    elsif reward_type == "D" # Cash
      reward_type = "DIAMOND"
    elsif reward_type == "G" # gold
      reward_type = "GOLD"
    elsif reward_type == "SP"
      reward_type = "STAMINA_PVP"
    elsif reward_type == "SA"
      reward_type = "STAMINA_ADVENTURE"
    elsif reward_type == "SS"
      reward_type = "STAMINA_SPECIAL"
    elsif reward_type == "FP"
      reward_type = "FRIEND_POINT"
    elsif reward_type == "GC"
      reward_type = "GACHA"
      argument = reward_value
      reward_value = 1 
    elsif reward_type == "EXP"
      reward_type = "EXP"
    else
      return error("inapposite reward_type. " + reward.to_s)
    end
    return reward_type, reward_value, argument
  end
  
  
  def shop_category_to_reward(reward_type)
    if reward_type == "MONSTER"
      return "M"
    elsif reward_type == "ITEM"
      return "I"
    elsif reward_type == "DIAMOND" # Cash
      return "D"
    elsif reward_type == "GOLD" # gold
      return "G"
    elsif reward_type == "STAMINA_PVP"
      return "SP"
    elsif reward_type == "STAMINA_ADVENTURE"
      return "SA"
    elsif reward_type == "STAMINA_SPECIAL"
      return "SS"
    elsif reward_type == "FRIEND_POINT"
      return "FP"
    elsif reward_type == "GACHA"
      return "GC"
    elsif reward_type == "EXP"
      return "EXP"
    else
      return nil
    end
  end
 
  def debug_logger(log_content)
    logger.debug "-------------------"
    logger.debug log_content      
    logger.debug "-------------------"
  end
  
  def to_datestr
    return params[:start_date] + " " + params[:start_time], params[:end_date] + " " + params[:end_time]
  end

  
  def datetime_to_str(datetime)
    return datetime.to_s
  end
    
  def near_date_data(start_date, end_date, table, column = "created_at", condition = nil)
    query = "#{column_name(column)} > '#{start_date}' and #{column_name(column)} < '#{end_date}'"    
    if condition != nil
      query = condition + " and " + query 
    end
 
    return table.where(query);
  end
  
  
  def log_to_db(log_type, value, user, character)
    character_no = 0
    if character != nil
      character_no = character.CHARACTER_NO
    end
    
    @remote_ip = request.remote_ip.encode('utf-8')
    @log = LogInstance.new(:LOG_NO => sequence("log_instances"), :USER_NO => user.USER_NO, :CHARACTER_NO => character_no, :LOG_TYPE => log_type, :VALUE => value, :CASH => user.CASH,
     :MONEY => user.MONEY, :USER_LV => user.USER_LV, :EXP => user.EXP, :ACTION_TIME => Time.now.utc, :IP => @remote_ip)
    @log.save
  end
  
  def get_min_value()
    @min_value = MaxValueInfo.where(:NEXT_COST => "MIN")
     if @min_value == nil
        return error("not find maxvalue ", 100040)
    end
    
    return @min_value 
    
  end
  
  #쌍방이 친구사이거나 신청이 들어와있는 사이인가? 
  def find_friend_instance(user_no, friend_user_no)
    @friend = FriendInstance.where(:USER_NO => user_no, :FRIEND_USER_NO => friend_user_no).first    
    if @friend == nil
      @friend = FriendInstance.where(:USER_NO => friend_user_no, :FRIEND_USER_NO => user_no).first        
    end     
    
    return @friend       
  end
  
  def get_monster_special_skill(monster_id,plus_percent)
    
    @monster_info = MonsterInfo.where(:MONSTER_ID => monster_id).first
      
    if @monster_info == nil
        return error("not found monster_info", 100004)
    end
            
    @actor_status_script = ActorStatusScript.where(:index => @monster_info.ACTOR_ID).first
    if @actor_status_script == nil
      return error("invalid @actor_status_script: " + @actor_status_script, 100018)
    end
    
    skill = @actor_status_script.skill_list    
    
    #--------------------------------------------------------------------------------------------
    # 스페셜 추가
    special_skill = @actor_status_script.special_skill.split("|")
    special_percent = @actor_status_script.special_skill_percent.split("|")
    
    if(special_skill.count != special_percent.count)
       return error("invalid @actor_status_script: " + @actor_status_script.to_s + "special_skill invalid", 100018)
    end
     
    special_hash = Hash.new
    
    for n in 0 ... special_skill.count
       special_hash[special_skill[n]] = special_percent[n]
    end
    special_skill_arr = special_hash.to_a
    special_skill_arr = special_skill_arr.sort { |x, y| x[1] <=> y[1] } 

    special_hash = Hash.new
    for n in 0 ... special_skill_arr.count
      random_for_percent = rand(0..100)
      
      if(special_percent[n].to_f > random_for_percent)
        special_hash[special_skill[n]] = special_percent[n].to_i + plus_percent.to_i
      end
    end
    
    # 스페셜 스킬은 하나만 배울수 있다
    if special_hash.count > 0
      skill << "|" + special_hash.to_a[0][0].to_s
    end 
    
    #--------------------------------------------------------------------------------------------

    # 엑터에 랜덤 스킬 가져오기
    random_skill = @actor_status_script.random_skill_list.split("|")
    random_percent = @actor_status_script.random_skill_percent.split("|")
    
    if(random_skill.count != random_percent.count)
       return error("invalid @actor_status_script: " + @actor_status_script.to_s + "random_skill invalid", 100018)
    end
      
    hash = Hash.new  
   
    for n in 0 ... random_skill.count
       hash[random_skill[n]] = random_percent[n]
    end
    random_skill_arr = hash.to_a
    random_skill_arr = random_skill_arr.sort { |x, y| x[1] <=> y[1] } 

    hash = Hash.new
    for n in 0 ... random_skill_arr.count
      random_for_percent = rand(0..100)
      
      if(random_percent[n].to_f > random_for_percent)
        hash[random_skill[n]] = random_percent[n]
      end
      
    end
    
    empty_skill_count = 4 - @actor_status_script.skill_list.split("|").count     
    for n in 0 ... empty_skill_count
      
      if(n > hash.count - 1)
        break;
      end

      skill << "|" + hash.to_a[n][0].to_s
       debug_logger(skill)
    end   

    return skill
  end
  
  def add_result_monster(result, type, value, monster_no)
    hash = Hash.new
    hash["RESULT_TYPE"] = type
    hash["RESULT_VALUE"] = value
    hash["MONSTER_NO"] = monster_no

    result[result.length] = hash
  end
  
  def add_result(result, type, value)
    hash = Hash.new
    hash["RESULT_TYPE"] = type
    hash["RESULT_VALUE"] = value

    result[result.length] = hash
  end
  
  def check_more_than_max_value(user)
    @user = user
    
    @monster_instances = MonsterInstance.where(:USER_NO => @user.USER_NO)
    
    @item_instances = ItemInstance.where(:USER_NO => @user.USER_NO , :SLOT_TYPE => "INVENTORY")
    
    @user.CACHE_ITEM_SLOT = @item_instances.count
    @user.CACHE_MONSTER_SLOT = @monster_instances.count
    @user.save 
    
    
    if(@user.CACHE_MONSTER_SLOT >= @user.EXT_MONSTER_SLOT  || @user.CACHE_ITEM_SLOT >= @user.EXT_ITEM_SLOT)
      check = false
    else
      check = true
    end

    return check
  end
  
  
  def daily_flatrate(user_no, item_instance)
    sender_no = 1
    title = "출석 보상"
    icon = "icon"
    end_date = Time.now + (60 * 60 * 24 * 3)
    
    options = item_instance.DEFAULT_OPTION.split("|")
    for n in 0...options.length
      if false == send_daily_reward(options[n], user_no,sender_no,title,icon,end_date)
        return false
      end
    end
     
    options = item_instance.OPTION_LIST.split("|")
    for n in 0...options.length
      if false == send_daily_reward(options[n], user_no,sender_no,title,icon,end_date)
        return false
      end
    end
    return true
  end  
  
  def send_daily_reward(options, user_no, sender_no, title, icon, end_date)
    reward_string = String.new
    content = "월 정액 일일 지급"
    
    option = options.split("_")
    if option[0] == "MONTH"    
      item_option = ItemOption.where(:GRADE => option[0], :DETAIL_ID => option[1].to_i).first
      if item_option == nil
        return error("not find item_option. " + options.to_s + " user_no:" + user_no, 120000)
      end
      
      reward_type = nil
      if item_option.OPTION_ID == 100000 # DIAMOND
        reward_type = "D"
      elsif item_option.OPTION_ID == 100001 # 곡옥 
        reward_type = "FP"
      elsif item_option.OPTION_ID == 100002 # 엽전
        reward_type = "G"
      else
        return error("invalid item_option. " + item_option.OPTION_ID.to_s + " user_no:" + user_no, 120000)
      end

      if reward_string != ""
        reward_string += "|"
      end
      
      reward_string = reward_string + reward_type + "_" + option[2]  
      
    end
    
    if reward_string != ""
      if false == send_to_mail(user_no, sender_no, title, content, reward_string, icon,end_date, "DAILY_FLATRATE")
        return false
      end      
    end
      
    return true
 end
 
#========================================================================================================================================
#========================================================================================================================================
#========================================================================================================================================

  def get_user(result, user_id)
    @user = UserInstance.where(:USER_ID => params[:user_id]).first
    if @user == nil
      return nil
    end
    
    hash = Hash.new
    hash["RESULT_TYPE"] = "USER"
    hash["RESULT_VALUE"] = @user
    result[result.length] = hash
    
    return @user    
  end
  
  def get_character_list(result, user)
    @character_instances = CharacterInstance.where(:USER_NO => user.USER_NO)
    if @character_instances == nil
      return error("not find character!  user_no:" + user.USER_NO, 0)
    end
      
    hash = Hash.new
    hash["RESULT_TYPE"] = "CHARACTER"
    hash["RESULT_VALUE"] = @character_instances
    result[result.length] = hash        
  end
  
  def get_monster(result, user)
    # 재진화 강종 상황 발생시
    @delete_monster_instance = MonsterInstance.where(:USER_NO => user.USER_NO, :CHARACTER_NO => -10)
    if @delete_monster_instance != nil
      i = 0
      @delete_monster_instance.each do |x|
        if i == 0
          x.CHARACTER_NO = 0
          x.save
          i = i + 1 
        else
          x.destroy
        end
      end
    end  
    
    @monster_instances = MonsterInstance.where(:USER_NO => user.USER_NO)
    
    user.CACHE_MONSTER_SLOT = @monster_instances.count 
    user.save

    if @monster_instances.count > 0
      hash = Hash.new
      hash["RESULT_TYPE"] = "MONSTER"
      hash["RESULT_VALUE"] = @monster_instances
      result[result.length] = hash
    end    
  end
  
  def get_item(result, user)
    @item_instances = ItemInstance.where("#{column_name("USER_NO")} = #{user.USER_NO} AND #{column_name("END_DATE")} >= '#{Time.now.utc}'")
    

    hide_count = @item_instances.where("#{column_name("SLOT_TYPE")} != 'HIDE'").count
    
    user.CACHE_ITEM_SLOT = @item_instances.count - hide_count
    user.save
    
    if @item_instances.count > 0
      hash = Hash.new
      hash["RESULT_TYPE"] = "ITEM"
      hash["RESULT_VALUE"] = @item_instances
      result[result.length] = hash    
    end
  end
  
  def get_skill(result, user, character_hash)
    
    skill_hash = Hash.new
    character_hash.each do |character|
      @skill_instances = SkillInstance.where(:CHARACTER_NO => character.CHARACTER_NO)
      skill_hash[character.CHARACTER_NO] = @skill_instances
    end

    hash = Hash.new
    hash["RESULT_TYPE"] = "SKILL"
    hash["RESULT_VALUE"] = skill_hash
    result[result.length] = hash  
  end
  
  def get_stage(result, user, character_hash)
    stage_hash = Hash.new
    character_hash.each do |character|
      @stage_clear_instance = StageClearInstance.where(:CHARACTER_NO => character.CHARACTER_NO).first
      if @stage_clear_instance == nil
        return error("not find item" + params[:user_no], 100051)
      end
      stage_hash[character.CHARACTER_NO] = @stage_clear_instance
    end

    hash = Hash.new
    hash["RESULT_TYPE"] = "STAGE_CLEAR"
    hash["RESULT_VALUE"] = stage_hash
    result[result.length] = hash  
  end
  
  def get_friend(result, user , update_time)
    @list1 = FriendInstance.where("#{column_name("USER_NO")} = #{user.USER_NO} AND #{column_name("updated_at")} > '#{update_time}'")  
    @list2 = FriendInstance.where("#{column_name("FRIEND_USER_NO")} = #{user.USER_NO} AND #{column_name("updated_at")} > '#{update_time}'") 
              
    @list1.each do |instance| 
      @friend = UserInstance.where(:USER_NO =>instance.FRIEND_USER_NO).first 
      if @friend == nil
        instance.STATE = -1
        instance.save
      end 
    end 
    
    @list2.each do |instance| 
      @friend = UserInstance.where(:USER_NO =>instance.USER_NO).first 
      if @friend == nil
        instance.STATE = -1
        instance.save
      end 
    end 

    @friend_instances = @list1 + @list2
    
    if @friend_instances.count > 0
      hash = Hash.new
      hash["RESULT_TYPE"] = "FRIEND"
      hash["RESULT_VALUE"] = @friend_instances
      result[result.length] = hash  
    end
  
  end

  def get_pvp(result)
    @ranker = PvpRankCacheInstance.all.order(:RANK)

    hash = Hash.new
    hash["RESULT_TYPE"] = "RANK"
    hash["RESULT_VALUE"] = @ranker
    result[result.length] = hash  
  end

  def get_mail(result, user, update_time)
    time_stamp = Time.now
    @mail_instances = MailInstance.where("#{column_name("USER_NO")} = #{user.USER_NO} and #{column_name("OPENED")} like '%0%' and #{column_name("END_DATE")} > '#{time_stamp}' and #{column_name("updated_at")} > '#{update_time}'")
    
    if @mail_instances.count > 0
      hash = Hash.new
      hash["RESULT_TYPE"] = "MAIL"
      hash["RESULT_VALUE"] = @mail_instances
      result[result.length] = hash  
    end
  end

  def get_tutorial(result, user)
    @tutorial_instance = TutorialInstance.where(:USER_NO => user.USER_NO).first
    if @tutorial_instance == nil
      @tutorial_instance = TutorialInstance.new(:TUTORIAL_NO => sequence("tutorial_instances"), :USER_NO => user.USER_NO,
                                                :FLOW_NO => "FIRST_PLAY" , :GACHA_GET_INSTANCE_NO => 0 , :STAGE_GET_INSTANCE_NO => 0)
      @tutorial_instance.save
    end
    
    hash = Hash.new
    hash["RESULT_TYPE"] = "TUTORIAL"
    hash["RESULT_VALUE"] = @tutorial_instance
    result[result.length] = hash  
  end

  def get_mastery(result , user , character_hash)
    
    mastery_hash = Hash.new
    character_hash.each do |character|
      @mastery_instance = MasteryInstance.where(:USER_NO => user.USER_NO  , :CHARACTER_NO => character.CHARACTER_NO)
      mastery_hash[character.CHARACTER_NO] = @mastery_instance
    end
    
    hash = Hash.new
    hash["RESULT_TYPE"] = "MASTERY"
    hash["RESULT_VALUE"] = mastery_hash
    result[result.length] = hash  
  end
  
  def get_quest(result, user, stage_clear_hash)
    arg_array = Array.new
    check_schedule(arg_array)

    arg_str = " #{column_name("QUEST_APPLY_TYPE")} = '#{"QUEST"}' and "
    # 연계 퀘스트가 있는 퀘스트는 이전 퀘스트 보상과 함계 생성한다
    arg_str << " #{column_name("NEXT_QUEST_ID")} = '#{0}' and "
    arg_str << "("  
    for i in 0...arg_array.count
      arg_str << arg_array[i]
      # 
      if i != (arg_array.count - 1)
        arg_str << " or "
      end
    end
    arg_str << ")"

    @quest_infos = QuestInfo.where(arg_str)
    debug_logger("apply schedule : " << arg_str)
    #debug_logger(@quest_infos.count.)  

    # 생성목록
    create_quest_list = Hash.new
    # 인스턴스 목록 -> 리턴할 값
    instance_quest_hash = Hash.new
    
    @quest_instances = QuestInstance.where(:USER_NO => user.USER_NO , :QUEST_APPLY_TYPE => "QUEST")
               
    if @quest_instances == nil || @quest_instances.count <= 0
      debug_logger(" quest_instances is nil , new create instances")  
      # 인스턴스가 하나도 없다
      # 엑티브에 있는 정보를 생성목록으로 이동     
      @quest_infos.each do |active_info|
        create_quest_list[active_info.QUEST_INFO_ID] = active_info
      end
      
      # 인스턴스가  하나도 없으면 옥새도 같이 생성한다
      arg_str = " #{column_name("QUEST_APPLY_TYPE")} = '#{"STAMP"}' and "
      arg_str << " #{column_name("GROUP_ID")} = '#{1}'"
      @stamp_infos = QuestInfo.where(arg_str)
      @stamp_infos.each do |active_info|
        create_quest_list[active_info.QUEST_INFO_ID] = active_info
      end
      
    else
      debug_logger(" quest_instances load ")  
      arr_quest_info = @quest_infos.to_a
      
      @quest_instances.each do |instance|
      #  if  hash_info.has_value?{|info| info.QUEST_INFO_ID == instance.QUEST_INFO_ID} == true
        if arr_quest_info.select{|value| value.QUEST_INFO_ID == instance.QUEST_INFO_ID}.count > 0 # == true #.has_value?{|info| info.QUEST_INFO_ID == instance.QUEST_INFO_ID} == true
          one_day = (60 * 60 * 24)
          #스케쥴을 체크해서 기간 만료면 삭제
          @temp_quest_infos = QuestInfo.where(:QUEST_INFO_ID => instance.QUEST_INFO_ID).first
          @temp_quest_schedules = QuestSchedule.where( :QUEST_SCHEDULE_ID => @temp_quest_infos.QUEST_SCHEDULE_ID).first
          
          if instance.created_at < @temp_quest_infos.updated_at && @temp_quest_infos != nil 
            @temp_quest_type = QuestType.where(:QUEST_TYPE_ID => @temp_quest_infos.QUEST_TYPE_ID).first
            if @temp_quest_type != nil
              instance.TYPE = @temp_quest_type.TYPE
              instance.GRADE = @temp_quest_infos.GRADE
              instance.GROUP_ID = @temp_quest_infos.GROUP_ID
              instance.created_at = Time.now
              instance.save
            end
          end
          
          if @temp_quest_schedules.QUEST_SCHEDULE_TYPE == "DAILY"
            if Time.now.beginning_of_day  - instance.ACTIVE_TIME.beginning_of_day > one_day
              instance.destroy
              next
            end
          elsif @temp_quest_schedules.QUEST_SCHEDULE_TYPE == "WEEKLY"
            if instance.ACTIVE_TIME.end_of_week < Time.now.beginning_of_day
              instance.destroy
              next
            end
          elsif @temp_quest_schedules.QUEST_SCHEDULE_TYPE == "MONTHLY"
            if instance.ACTIVE_TIME.end_of_month < Time.now.beginning_of_day
              instance.destroy
              next
            end
          end
          
          # active에도 있고 Instance도 있는 케이스
          hash = Hash.new
          hash["RESULT_TYPE"] = "QUEST_INSTANCE"
          hash["RESULT_VALUE"] = instance
          instance_quest_hash[instance_quest_hash.length] = hash
            
          arr_quest_info.delete_if{|info| info.QUEST_INFO_ID == instance.QUEST_INFO_ID}
        else
          # Instance는 있는데 Active에 없다 그렇다면 삭제를 진행한다
          @temp_quest_infos = QuestInfo.where(:QUEST_INFO_ID => instance.QUEST_INFO_ID).first
          @temp_quest_schedules = QuestSchedule.where( :QUEST_SCHEDULE_ID => @temp_quest_infos.QUEST_SCHEDULE_ID).first
          
          if @temp_quest_schedules.QUEST_SCHEDULE_TYPE == "QUEST" || @temp_quest_schedules.QUEST_SCHEDULE_TYPE == "ACHIEVE"
    
            if instance.created_at < @temp_quest_infos.updated_at && @temp_quest_infos != nil 
              @temp_quest_type = QuestType.where(:QUEST_TYPE_ID => @temp_quest_infos.QUEST_TYPE_ID).first
              if @temp_quest_type != nil
                instance.TYPE = @temp_quest_type.TYPE
                instance.GRADE = @temp_quest_infos.GRADE
                instance.GROUP_ID = @temp_quest_infos.GROUP_ID
                instance.created_at = Time.now
                instance.save
              end
            end

             hash = Hash.new
             hash["RESULT_TYPE"] = "QUEST_INSTANCE"
             hash["RESULT_VALUE"] = instance
             instance_quest_hash[instance_quest_hash.length] = hash     
          else
            instance.delete
          end
        end
      end
      
      @stamp_infos = stamp_clear(user, instance_quest_hash)
      debug_logger(@stamp_infos)
      
      # 새로 생성해야 할 옥새가 있을때만 생성 한다
      if @stamp_infos != nil
        @stamp_infos.each do |active_info|
          create_quest_list[active_info.QUEST_INFO_ID] = active_info
        end
      end
      
      # active 에 있는데 Instance는 없는 케이스
      arr_quest_info.each do |active_info|
        create_quest_list[active_info.QUEST_INFO_ID] = active_info
      end
   end
       
    # Create List에 있는 목록을 생성한다
    create_quest_list.each do |key,create_info|
      create_quest(user.USER_NO, create_info, instance_quest_hash , stage_clear_hash)
    end

    hash = Hash.new
    hash["RESULT_TYPE"] = "QUEST"
    hash["RESULT_VALUE"] = instance_quest_hash
    result[result.length] = hash  
    
    # 다른데서도 사용하기 위해 리턴한다.
    return instance_quest_hash
    
  end
  
  
  def create_quest(user_no, quest_info, instance_quest_hash, stage_clear_hash)
    @quest_types = QuestType.where(:QUEST_TYPE_ID => quest_info.QUEST_TYPE_ID).first
    if @quest_types == nil
      return error("not found quest_type : #{ quest_info.QUEST_TYPE_ID }" , 120001)
    end
      
    quest_value = 0
    if @quest_types.TYPE == "STAGE_CLEAR_COMPLETE" || @quest_types.TYPE == "STAGE_CLEAR"
      if stage_clear_hash != nil
        stage_clear_hash.each do |key,stage_clear|
          if nil != stage_clear.CLEAR_STAGE.index(quest_info[:GRADE].to_s)
            quest_value = quest_info[:MAXVALUE]
            next
          end
        end
       end      
    end
    
    @quest_instance = QuestInstance.new( :QUEST_NO => sequence("quest_instances"), :QUEST_INFO_ID => quest_info.QUEST_INFO_ID, :USER_NO => user_no,
     :TYPE => @quest_types.TYPE ,:QUEST_VALUE => quest_value,  :ACTIVE_TIME => Time.zone.now, :CLEAR => "NONE" , :CLEAR_TIME => Time.new(1990) , 
     :GRADE => quest_info.GRADE , :QUEST_APPLY_TYPE => quest_info.QUEST_APPLY_TYPE , :GROUP_ID => quest_info.GROUP_ID)
    
    @quest_instance.save
      
    hash = Hash.new
    hash["RESULT_TYPE"] = "QUEST_INSTANCE"
    hash["RESULT_VALUE"] = @quest_instance
    instance_quest_hash[instance_quest_hash.length] = hash
   end
     
  def stamp_clear(user, instance_quest_hash)
    arg_str = " #{column_name("USER_NO")} = '#{user.USER_NO}' and "
    arg_str << " #{column_name("QUEST_APPLY_TYPE")} = '#{"STAMP"}' and "
    arg_str << " #{column_name("CLEAR")} != '#{"CLEARED"}'"
    @quest_instances = QuestInstance.where(arg_str)
    
    if @quest_instances.count == nil || @quest_instances.count <= 0
      # 모두 클리어 상태이면 기존걸 삭제후 새로 생성한다
      
      arg_str = " #{column_name("USER_NO")} = '#{user.USER_NO}' and "
      arg_str << " #{column_name("QUEST_APPLY_TYPE")} = '#{"STAMP"}'"
      @quest_instances = QuestInstance.where(arg_str)
      
      if @quest_instances == nil
          # 이전에 받은 옥새가 없다
        return nil
      end
      
      next_group_id = 0
      
      @quest_instances.each do |instance|
        next_group_id = instance.GROUP_ID
        instance.delete
      end
      
      if(next_group_id == 0)
        #다음 그룹 아이디 확인 불가
      end
      
      next_group_id = next_group_id + 1
      
      # 인스턴스가  하나도 없으면 옥새도 같이 생성한다
      arg_str = " #{column_name("QUEST_APPLY_TYPE")} = '#{"STAMP"}' and "
      arg_str << " #{column_name("GROUP_ID")} = '#{next_group_id}'"
      
      @stamp_infos = QuestInfo.where(arg_str)
      return @stamp_infos
      
    else
      arg_str = " #{column_name("USER_NO")} = '#{user.USER_NO}' and "
      arg_str << " #{column_name("QUEST_APPLY_TYPE")} = '#{"STAMP"}'"
      @quest_instances = QuestInstance.where(arg_str)
       
      @quest_instances.each do |instance|
        @temp_quest_infos = QuestInfo.where(:QUEST_INFO_ID => instance.QUEST_INFO_ID).first
        if instance.created_at < @temp_quest_infos.updated_at && @temp_quest_infos != nil 
          @temp_quest_type = QuestType.where(:QUEST_TYPE_ID => @temp_quest_infos.QUEST_TYPE_ID).first
          if @temp_quest_type != nil
            instance.TYPE = @temp_quest_type.TYPE
            instance.GRADE = @temp_quest_infos.GRADE
            instance.GROUP_ID = @temp_quest_infos.GROUP_ID
            instance.created_at = Time.now
            instance.save
          end
        end
      end

      if @quest_instances == nil
        return nil
      end

      @quest_instances.each do |instance|
        hash = Hash.new
        hash["RESULT_TYPE"] = "QUEST_INSTANCE"
        hash["RESULT_VALUE"] = instance
        instance_quest_hash[instance_quest_hash.length] = hash
      end
      
      return nil
    end  
  end
  
   def check_schedule(arg_array)
     now_time = Time.now
     
     @quest_schedules = QuestSchedule.all
     
     @quest_schedules.each{ |info|
       type = info.QUEST_SCHEDULE_TYPE.to_str
        #---------------------------------------------------------------------------------------
       if type == "DAILY"  # 일간 인지 체크
         # 홀 짝 비교
         check = false;
         
         d = now_time.day
         if info.ODD_OR_EVEN.to_str == "ODD"
           if (d.to_i % 2) != 0
             check = true;
           end
         elsif info.ODD_OR_EVEN.to_str == "EVEN"
         if (d.to_i % 2) == 0
             check = true;
           end
         elsif info.ODD_OR_EVEN.to_str == "NONE"
           check = true;
         end
         
         # 시간 확인
         start_date = info.START.to_datetime
         end_date = info.END.to_datetime
         
         start_date = Time.new(now_time.year, now_time.month, now_time.day, start_date.hour, start_date.min, start_date.sec).to_datetime
         end_date = Time.new(now_time.year, now_time.month, now_time.day, end_date.hour, end_date.min, end_date.sec).to_datetime
         
         if start_date < now_time && end_date > now_time
            if check == true
              arg_array.push("#{column_name("QUEST_SCHEDULE_ID")} = #{info.QUEST_SCHEDULE_ID}")
            end
         end 

       end
       #---------------------------------------------------------------------------------------
       if type == "WEEKLY"  # 주간 인지 체크
         check = false;
         t = now_time.beginning_of_month()
         d = now_time.day
         plus_day = 0;
         
         if t.monday?
            plus_day = 0
         end
         if t.tuesday?
           plus_day = 1
         end
         if t.wednesday?
           plus_day = 2
         end
         if t.thursday?
           plus_day = 3
         end
         if t.friday?
           plus_day = 4
         end
         if t.saturday?
           plus_day = 5
         end
         if t.sunday?
           plus_day = 6
         end
         
         if info.ODD_OR_EVEN.to_str == "ODD"
           if ((d + plus_day) / 8) % 2 == 0
             check = true;
           end
         elsif info.ODD_OR_EVEN.to_str == "EVEN"
         if ((d + plus_day) / 8) % 2 != 0
             check = true;
           end
         elsif info.ODD_OR_EVEN.to_str == "NONE"
           check = true;
         end
         
         monday_day = now_time.beginning_of_week()
         start_time = info.START.to_datetime
         start_day = Time.new(monday_day.year,monday_day.month,monday_day.day,start_time.hour,start_time.min,start_time.sec)
         
         
         sunday_day = now_time.end_of_week() # 마지막날이 일요일을 넘어가면 오류 난다 수정해야한다
         end_time = info.END.to_datetime
         end_day = Time.new
         
         if monday_day.month != sunday_day.month
           last_day = now_time.end_of_month()
           end_day  = Time.new(last_day.year, last_day.month, last_day.day, end_time.hour, end_time.min, end_time.sec)
         else
           end_day = Time.new(sunday_day.year, sunday_day.month, sunday_day.day, end_time.hour, end_time.min, end_time.sec)
         end

         if (now_time <=> start_day) != -1 && (end_day <=> now_time) != -1
             if check == true
               arg_array.push("#{column_name("QUEST_SCHEDULE_ID")} = #{info.QUEST_SCHEDULE_ID}")
            end
         end
       end
       #---------------------------------------------------------------------------------------
       if type == "MONTHLY"  # 월간 인지 체크
         check = false;
        if info.ODD_OR_EVEN.to_str == "ODD"
          if (now_time.month % 2) != 0
             check = true;
           end
        elsif info.ODD_OR_EVEN.to_str == "EVEN"
          if (now_time.month % 2) == 0
             check = true;
           end
        elsif info.ODD_OR_EVEN.to_str == "NONE"
           check = true;
        end

         # 1일 체크
         start_time = info.START.to_datetime # time_utc_parser( info.START )
         first_day = now_time.beginning_of_month()
         start_day = Time.new(first_day.year, first_day.month, first_day.day, start_time.hour, start_time.min, start_time.sec)

         # 마지막 날짜 체크
         end_time = info.END.to_datetime # time_utc_parser( info.END )
         last_day = now_time.end_of_month()
         end_day = Time.new(last_day.year, last_day.month, last_day.day, end_time.hour, end_time.min, end_time.sec)

         if (now_time <=> start_day) != -1 && (end_day <=> now_time) != -1
             if check == true
               arg_array.push("#{column_name("QUEST_SCHEDULE_ID")} = #{info.QUEST_SCHEDULE_ID}")
            end
         end
       end
       #---------------------------------------------------------------------------------------
       if type == "EVENT"  # 이벤트 인지 체크
         start_day = info.START.to_datetime
         end_day = info.END.to_datetime
         
         if (now_time <=> start_day) != -1 && (end_day <=> now_time) != -1
           arg_array.push("#{column_name("QUEST_SCHEDULE_ID")} = #{info.QUEST_SCHEDULE_ID}")
         end
       end
       #---------------------------------------------------------------------------------------
       if type == "QUEST" # 업적 인지 체크
         arg_array.push("#{column_name("QUEST_SCHEDULE_ID")} = #{info.QUEST_SCHEDULE_ID}")
       end
       #---------------------------------------------------------------------------------------
       if type == "ACHIEVE"
         arg_array.push("#{column_name("QUEST_SCHEDULE_ID")} = #{info.QUEST_SCHEDULE_ID}")
       end
       #---------------------------------------------------------------------------------------
     }
      
   end
   
  def stamina_check(user_instance)  
    @user = user_instance
          
    delta_time = Time.now - @user.STAMINA_PVP_TIME 
    delta_minutes = (delta_time / 60).to_i
    if 30 <= delta_minutes 
      delta_stamina = delta_minutes / 30
      
      if @user.STAMINA_PVP < 5
        @user.STAMINA_PVP = @user.STAMINA_PVP.to_i + delta_stamina
        @user.STAMINA_PVP = [@user.STAMINA_PVP, 5].min
      end

      @user.STAMINA_PVP_TIME = Time.now - (delta_time - (delta_stamina * 30 * 60))
    end

    delta_time = Time.now - @user.STAMINA_ADVENTURE_TIME  
    delta_minutes = (delta_time / 60).to_i
    
    debug_logger("기존 STAMINA_ADVENTURE_TIME : " + @user.STAMINA_ADVENTURE_TIME.to_s)
    debug_logger((delta_time / 60).to_i.to_s + "분 " + (delta_time % 60).to_i.to_s + "초 지남") 
    
    if 10 <= delta_minutes 
      delta_stamina = delta_minutes / 10                
      if @user.STAMINA_ADVENTURE < 5
        @user.STAMINA_ADVENTURE = @user.STAMINA_ADVENTURE.to_i + delta_stamina
        @user.STAMINA_ADVENTURE = [@user.STAMINA_ADVENTURE, 5].min
      end

      debug_logger((delta_time - (delta_stamina * 10 * 60)).to_i.to_s + "초 만큼 세이브 되어있음")
      @user.STAMINA_ADVENTURE_TIME = Time.now - (delta_time - (delta_stamina * 10 * 60))
    end
  
    delta_time = Time.now - @user.STAMINA_SPECIAL_TIME 
    delta_minutes = (delta_time / 60).to_i
    if 30 <= delta_minutes 
      delta_stamina = delta_minutes / 30                
      if @user.STAMINA_SPECIAL < 5
        @user.STAMINA_SPECIAL = @user.STAMINA_SPECIAL.to_i + delta_stamina
        @user.STAMINA_SPECIAL = [@user.STAMINA_SPECIAL, 5].min
      end
      
      @user.STAMINA_SPECIAL_TIME = Time.now - (delta_time - (delta_stamina * 30 * 60))
    end
    
    return @user  
  end 
  
     
  def to_midnight(time = Time.now)
    return Time.parse(time.to_date.to_s + " 00:00:00").utc
  end

  def composite_reward_params
    reward = String.new
    for x in 0..10
      value = "value" + x.to_s
      type = "type" + x.to_s
      if params[value] != nil && params[value] != ""
        if reward.size != 0
          reward += "|"
        end
        reward += shop_category_to_reward(params[type]) + "_" + params[value]
      end
    end
    return reward
  end
  
end
