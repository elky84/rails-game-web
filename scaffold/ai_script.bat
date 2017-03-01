cd ..\web_server
call rails generate scaffold ai_script  index:integer:index ai_type:text protect_object_name:text protect_range:text search_range:text search_enemy_type:text idle_time_stop:text idle_time_random_range:text attack_time_stop:text idle_move_range:text go_away_time:text go_away_plus_random:text state_stay_time:text fixed_idle_stay_time:text skill_use_percent:text attack_after_type:text is_all_include_phase:integer is_reset_under_attack:integer add_serch_range:text --force
cd ..\scaffold
call ruby modify_create_method.rb ai_script index
call ruby modify_before_action.rb ai_script index
call ruby modify_index_method.rb ai_script index
call ruby modify_model.rb ai_script index
