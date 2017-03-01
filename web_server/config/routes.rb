Rails.application.routes.draw do

  resources :evolution_infos
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  get 'notice/save'
  
  get 'report/write'
  get 'report/search'

  get 'item/select_sell'
  post 'item/select_sell'

  resources :report_instances
  get 'log/find_by_nickname'
  get 'log/find_by_action'
  get 'log/payment'
  get 'log/payment_list'

  get 'event/save'

  get 'notice/save'

  resources :event_instances
  get 'shop/get_key'

  get 'notice/get'

  get 'tutorial/set'
  get 'quest/set_quest'
  get 'quest/update_quest'
  post 'quest/update_quest'
  get 'tutorial/get'

  get 'tutorial/update'
  post 'tutorial/update'

  get 'tutorial/destroy'

  resources :tutorial_instances

  resources :connect_restricts  

  get 'version/get'
  
  get 'user/get_user_and_lastestchr'
  get 'user/nickname_duplicate_check'
  get 'user/battle_info'

  resources :version_instances

  resources :user_instances

  resources :user_grows

  resources :user_give_instances

  resources :statuses

  resources :statistics_instances

  resources :stage_instances

  resources :stage_infos

  resources :stage_clear_instances

  resources :skill_scripts

  resources :skill_instances

  resources :skill_enchants

  resources :shop_items

  resources :server_lists

  resources :quest_types

  resources :quest_schedules

  resources :quest_instances

  resources :quest_infos

  resources :pvp_succession_bonus_infos

  resources :pvp_reward_infos

  resources :pvp_record_instances

  resources :pvp_rank_cache_instances

  resources :pvp_ranges

  resources :pvp_periods

  resources :pvp_instances

  resources :phase_infos

  resources :parameters

  resources :options

  resources :notice_instances

  resources :monster_instances

  resources :monster_infos

  resources :monster_grows

  resources :monster_grade_bonus

  resources :monster_gen_infos

  resources :monster_enchant_bonus

  resources :monster_enchants

  resources :max_value_infos

  resources :mastery_resets

  resources :mastery_point_infos

  resources :mastery_instances

  resources :mastery_infos

  resources :mail_instances

  resources :log_instances

  resources :item_reoptions

  resources :item_options

  resources :item_instances

  resources :item_infos

  resources :item_enchant_effects

  resources :item_enchants

  resources :gacha_machines

  resources :gacha_groups

  resources :gachas

  resources :friend_instances

  resources :evolution_infos

  resources :daycheck_instances

  resources :daychecks

  resources :coupon_instances

  resources :conditions

  resources :character_instances

  resources :character_infos

  resources :character_grows

  resources :auth_instances

  resources :area_infos

  resources :ai_scripts

  resources :actor_status_scripts

  resources :shop_items

  resources :user_instances

  resources :quest_instances
  resources :statistics_instances
  resources :character_instances

  resources :user_instances

  resources :character_instances

  resources :mastery_point_infos

  resources :actor_status_scripts

  resources :quest_instances
  
  get 'stamp/set'

  get 'stamp/get'

  get 'stamp/reward'

  resources :quest_infos
  get 'monster_evolution/evolution'
  post 'monster_evolution/evolution'
  get 'monster_evolution/evolution_confirm'

  get 'maxvalue/get'
  
  
  get 'coupon/use_relay'

  get 'coupon/issue'
  get 'coupon/issue_list'
  get 'coupon/use'
  get 'coupon/show'
  get 'coupon/find_by_code'
  get 'coupon/find_by_nickname'


  get 'server_list/get'
  get 'server_list/update'


  get 'quest/create'
  post 'quest/create'
  
  get 'quest/update'
  post 'quest/update'
  
  get 'quest/set'

  get 'quest/get'

  get 'quest/drop'
  get 'quest/find_by_nickname'
  get 'quest/clear'
  
  
  get 'daycheck/all'

  get 'daycheck/get'

  get 'daycheck/update'
  get 'daycheck/find_by_nickname'

  get 'daycheck/destroy'
  
  get 'pvp/get_period'
  get 'pvp/end_of_competition'  
  get 'pvp/end_of_competition_1st'
  get 'pvp/end_of_competition_2nd'
  
  get 'pvp/getrecord'

  get 'pvp/get'
  
  get 'pvp/nomercy'
  
  get 'pvp/getrank'


  get 'pvp/setting'

  get 'pvp/new'
  post 'pvp/new'
  
  get 'pvp/set'

  get 'pvp/search'

  get 'pvp/change'
  
  get 'pvp/result'
  get 'pvp/find_by_nickname'


  get 'shop/buy'
  get 'shop/buy_cash'


  get 'stage_result/result'
  
  get 'stage_result/continue'
  

  get 'mail/find_by_nickname'
  get 'mail/all'
  get 'mail/record'

  post 'mail/receive'
  get 'mail/receive'
  get 'mail/receive_all'

  get 'mail/send_mail'
  get 'mail/send_mail_all'
  get 'mail/send_mail_list'
  get 'mail/send_mail_level'

  get 'skill/enchant'
  get 'skill/learn'
  get 'skill/all'

  post 'skill/enchant'
  post 'skill/save'
  get 'skill/find_by_nickname'

  get 'stage_clear/find_by_nickname'

  get 'stage_clear/all'

  get 'stage_clear/get'

  get 'stage_clear/new'
  post 'stage_clear/new'

  get 'stage_clear/save'
  post 'stage_clear/save'
 
  get 'stage_clear/destroy'
  post 'stage_clear/destroy'
  get 'stage/find_by_nickname'

  get 'item_reoption/reoption'
  post 'item_reoption/reoption'

  get 'item_enchant/enchant'
  post 'item_enchant/enchant'


  get 'item/get'
  get 'item/find_by_nickname'
  get 'item/equip_find_by_nickname'

  get 'item/all'

  get 'item/inventory'

  get 'item/equip'

  get 'item/postbox'

  get 'item/buff'

  get 'item/sell'
  post 'item/sell'


  get 'monster/all'

  get 'monster/save'
  post 'monster/save'
  
  get 'monster/destroy'
  post 'monster/destroy'
  
  get 'monster/get'
  
  get 'monster/enchant'
  post 'monster/enchant'
  get 'monster/find_by_nickname'

  get 'stage/all'

  get 'stage/get'
  post 'stage/get'
  
  get 'stage/save'
  post 'stage/save'
  
  get 'stage/destroy'
  post 'stage/destroy'
  get 'stage/find_by_nickname'


  get 'mastery_drop/get'
  post 'mastery_drop/get'

  get 'mastery/all'
  post 'mastery/all'
  
  get 'mastery/buypoint'
  post 'mastery/buypoint'

  post 'mastery_save/save'
  post 'mastery_save/reset'
  get 'mastery_save/reset'
  get 'mastery/find_by_nickname'


  get 'character/find_by_nickname'

  get 'character/new'

  get 'character/delete'

  get 'character/list'
  
  get 'character/get'


  get 'item_equip/save'
  post 'item_equip/save'

  get 'friend/adventurer'
  get 'friend/find_by_nickname'

  get 'friend/get'

  get 'friend/propose'

  get 'friend/answer'

  get 'friend/delete'
  
  get 'friend/sendpoint'

  get 'friend/sendgift'
  
  
  get 'user/find_by_nickname'
  
  get 'user/reply_action'

  get 'user/sign_in'

  get 'user/sign_up'

  delete 'user/deactivate'

  post 'user/heartbeat'
  
  get 'user/lastestchr'

  get 'user/get'

  get 'user/getrandlist'
  
  get 'user/search'
  
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"  
  root :to => "home#index"

  get 'home/event'
  get 'home/coupon'
  get 'home/mail'
  get 'home/user'
  get 'home/statistics'
  get 'home/dev'
  get 'home/maintenance'
  get 'home/log'
  
  get 'statistics/uv'
  get 'statistics/nru'
  get 'statistics/retention'
  get 'statistics/dau'
  get 'statistics/cu'
  get 'statistics/first_bu'
  get 'statistics/dbu'
  get 'statistics/user_level_rate'
  get 'statistics/character_level_rate'
  get 'statistics/buy_shop_by_shop_id'
  get 'statistics/monster_by_monster_id'
  get 'statistics/item_by_item_id'
  get 'statistics/stage_by_stage_id'
  get 'statistics/all_diamond'
  get 'statistics/all_money'

  get 'statistics/gacha_monster'
  get 'statistics/gacha_monster_grade'
  get 'statistics/gacha_item'
  get 'statistics/gacha_item_grade'
  get 'statistics/log_by_user_level_rate'
  
  get 'statistics/pvp'
  get 'statistics/pvp_rating'
  get 'statistics/item_enchant'
  get 'statistics/skill_enchant'
  get 'statistics/monster_enchant'
  get 'statistics/monster_evolution'
  get 'statistics/summon_friend'
  get 'statistics/mastery'
  get 'statistics/ext_slot'
  get 'statistics/buy_mastery_point'
  get 'statistics/cash_gacha'
  get 'statistics/quest'
  get 'statistics/daily_quest'
  get 'statistics/stage_reward'
  get 'statistics/stage_enter'
  
  get 'statistics/ru_last'
  get 'statistics/cu_last'

  get 'statistics/record_uv'
  get 'statistics/record_nru'
  get 'statistics/record_retention'
  get 'statistics/record_dau'
  get 'statistics/record_cu'
  get 'statistics/record_first_bu'
  get 'statistics/record_dbu'
  get 'statistics/record_user_level_rate'
  get 'statistics/record_character_level_rate'
  get 'statistics/record_item_by_item_id'
  get 'statistics/record_monster_by_monster_id'
  get 'statistics/record_buy_shop_by_shop_id'
  get 'statistics/record_stage_by_stage_id'
  get 'statistics/record_all_diamond'
  get 'statistics/record_all_money'
  get 'statistics/record_gacha'
  get 'statistics/record_log_by_user_level_rate'
  
  
  get 'statistics/record_pvp'
  get 'statistics/record_pvp_rating'
  get 'statistics/record_item_enchant'
  get 'statistics/record_skill_enchant'
  get 'statistics/record_monster_enchant'
  get 'statistics/record_monster_evolution'
  get 'statistics/record_summon_friend'
  get 'statistics/record_mastery'
  get 'statistics/record_ext_slot'
  get 'statistics/record_buy_mastery_point'
  get 'statistics/record_cash_gacha'
  get 'statistics/record_quest'
  get 'statistics/record_daily_quest'
  get 'statistics/record_stage_reward'
  get 'statistics/record_stage_enter'
end
