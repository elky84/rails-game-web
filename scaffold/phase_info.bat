cd ..\web_server
call rails generate scaffold phase_info  PHASE_ID:integer:index INIT_POS:text MOVE_TIME:text CLEAR:text WAIT_TIME:text STAY_TIME:text MONSTER:text MONSTER_GEN_INFO:text MONSTER_LV:text APPEAR_SPEED:text APPEAR_TIME:text TEAM_INDEX:text START_SCENARIO:text END_SCENARIO:text IS_BOSS_PHASE:integer PHASE_WIDTH:text --force
cd ..\scaffold
call ruby modify_create_method.rb phase_info PHASE_ID
call ruby modify_before_action.rb phase_info PHASE_ID
call ruby modify_index_method.rb phase_info PHASE_ID
call ruby modify_model.rb phase_info PHASE_ID
