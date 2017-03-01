cd ..\web_server
call rails generate scaffold evolution_info  EVOLUTION_ID:integer:index GRADE:integer RAW:integer SPECIAL_MONSTER_LIST:text SPECIAL_SKILL_LIST:text RESULT:text RESULT_PERCENT:text PRICE_COIN:integer PRICE_DIAMOND:integer EVOLUTION_EVENT_TYPE:text PERCENT_UP:integer START_DATE_TIME:timestamp END_DATE_TIME:timestamp --force
cd ..\scaffold
call ruby modify_create_method.rb evolution_info EVOLUTION_ID
call ruby modify_before_action.rb evolution_info EVOLUTION_ID
call ruby modify_index_method.rb evolution_info EVOLUTION_ID
call ruby modify_model.rb evolution_info EVOLUTION_ID
