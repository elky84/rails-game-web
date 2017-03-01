cd ..\web_server
call rails generate scaffold pvp_record_instance  PVP_RECORD_INSTANCE_NO:integer:index SEASON_NUM:integer CHARACTER_NO:integer RESULT:text RESULT_TIME:timestamp ADD_RATING:integer RESULT_RATING:integer MATCH_CHARACTER_NO:integer MATCH_CHR_LV:integer MATCH_CHR_ID:integer MATCH_USER_NICKNAME:text MATCH_USER_LV:integer MATCH_CHR_DEF_POWER:text MATCH_MONSTER_ID:text MATCH_MONSTER_LV:text --force
cd ..\scaffold
call ruby modify_create_method.rb pvp_record_instance PVP_RECORD_INSTANCE_NO
call ruby modify_before_action.rb pvp_record_instance PVP_RECORD_INSTANCE_NO
call ruby modify_index_method.rb pvp_record_instance PVP_RECORD_INSTANCE_NO
call ruby modify_model.rb pvp_record_instance PVP_RECORD_INSTANCE_NO
