cd ..\web_server
call rails generate scaffold stage_info  STAGE_ID:integer:index AREA_ID:integer STAGE_NUMBER:text OPEN:text TYPE:text LEVEL:text COORDINATE:text BGM:text BG_COLOR:text NAME:text EXPLAIN:text CHARACTER_LEVEL:text STAMINA:text PHASE:text MONSTER:text ITEM:text STAGE_ICON:text CLEAR_SCORE:text CLEAR_EXP:text CLEAR_MONEY:text CLEAR_1_REWARD:text CLEAR_1_REWARD_PROBABILITY:text CLEAR_2_REWARD:text CLEAR_2_REWARD_PROBABILITY:text CLEAR_3_REWARD:text CLEAR_3_REWARD_PROBABILITY:text START_SCENARIO:text END_SCENARIO:text BG_PREFEB:text INFI_TOWER_SP_REWARD:text INFI_TOWER_PREVIEW:text --force
cd ..\scaffold
call ruby modify_create_method.rb stage_info STAGE_ID
call ruby modify_before_action.rb stage_info STAGE_ID
call ruby modify_index_method.rb stage_info STAGE_ID
call ruby modify_model.rb stage_info STAGE_ID
