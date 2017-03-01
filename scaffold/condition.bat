cd ..\web_server
call rails generate scaffold condition  CONDITION_ID:integer:index CONDITION_EFFECT:text CONDITION_INFO:text PERCENT:integer CONDITION_APPLY_TYPE:text --force
cd ..\scaffold
call ruby modify_create_method.rb condition CONDITION_ID
call ruby modify_before_action.rb condition CONDITION_ID
call ruby modify_index_method.rb condition CONDITION_ID
call ruby modify_model.rb condition CONDITION_ID
