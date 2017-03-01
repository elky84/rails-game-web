cd ..\web_server
call rails generate scaffold pvp_instance  CHARACTER_NO:integer:index CHARACTER_LV:integer CHARACTER_ID:integer COSTUME_ID:integer USER_NO:integer USER_NICKNAME:text USER_LV:integer RATING:integer PARTY_ATTACKER:text ATTACKER_POWER:text PARTY_DEFENDER:text DEFENDER_POWER:text SEASON_NUM:integer IS_SUCCESSION_VICTORY:text SUCCESSION_COUNT:integer VICTORY_COUNT:integer DEFEAT_COUNT:integer CUR_MATCH_NO:integer RANK:integer --force
cd ..\scaffold
call ruby modify_create_method.rb pvp_instance CHARACTER_NO
call ruby modify_before_action.rb pvp_instance CHARACTER_NO
call ruby modify_index_method.rb pvp_instance CHARACTER_NO
call ruby modify_model.rb pvp_instance CHARACTER_NO
