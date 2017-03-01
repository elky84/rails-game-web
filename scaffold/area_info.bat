cd ..\web_server
call rails generate scaffold area_info  AREA_ID:integer:index OPEN:text START_DATE:timestamp END_DATE:timestamp AREA_TYPE:text BG_COLOR:text NAME:text EXPLAIN:text CHARACTER_LEVEL:text IMAGE:text MISSION:text MONSTER:text ITEM:text SCENARIO_START:text SCENARIO_END:text --force
cd ..\scaffold
call ruby modify_create_method.rb area_info AREA_ID
call ruby modify_before_action.rb area_info AREA_ID
call ruby modify_index_method.rb area_info AREA_ID
call ruby modify_model.rb area_info AREA_ID
