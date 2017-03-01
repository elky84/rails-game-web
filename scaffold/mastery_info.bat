cd ..\web_server
call rails generate scaffold mastery_info  MASTERY_ID:integer:index MASTERY_TYPE:text GRADE:integer NAME:text EXPLAIN:text MAX_LEVEL:integer OPTION_ID:text OPTION_EFFECT:text EFFECT_TARGET:text PRE_LEVEL:integer PRE_CONDITION:integer ICON:text --force
cd ..\scaffold
call ruby modify_create_method.rb mastery_info MASTERY_ID
call ruby modify_before_action.rb mastery_info MASTERY_ID
call ruby modify_index_method.rb mastery_info MASTERY_ID
call ruby modify_model.rb mastery_info MASTERY_ID
