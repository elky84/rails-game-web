cd ..\web_server
call rails generate scaffold region_info  REGION_ID:integer:index OPEN:text CATEGORY:text IMAGE:text NAME:text EXPLAIN:text LEVEL:text NORMAL_STAGE:text HARD_STAGE:text HELL_STAGE:text MONSTER:text ITEM:text SCENARIO_START:text SCENARIO_END:text --force
cd ..\scaffold
call ruby modify_create_method.rb region_info REGION_ID
call ruby modify_before_action.rb region_info REGION_ID
call ruby modify_index_method.rb region_info REGION_ID
call ruby modify_model.rb region_info REGION_ID
