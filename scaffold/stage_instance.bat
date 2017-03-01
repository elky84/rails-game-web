cd ..\web_server
call rails generate scaffold stage_instance  STAGE_PROGRESS_NO:integer:index USER_NO:integer CHARACTER_NO:integer PARTY_MONSTER_ID:text STAGE_ID:integer CLEAR_EXP_NO:text CLEAR_MONEY_NO:text CLEAR_REWARD_NO:text START_DATE:text --force
cd ..\scaffold
call ruby modify_create_method.rb stage_instance STAGE_PROGRESS_NO
call ruby modify_before_action.rb stage_instance STAGE_PROGRESS_NO
call ruby modify_index_method.rb stage_instance STAGE_PROGRESS_NO
call ruby modify_model.rb stage_instance STAGE_PROGRESS_NO
