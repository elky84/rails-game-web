cd ..\web_server
call rails generate scaffold daycheck  DAYCHECK_ID:integer:index USER_TYPE:integer DAY:integer REWARD:text UI_LABEL:text ICON:text --force
cd ..\scaffold
call ruby modify_create_method.rb daycheck DAYCHECK_ID
call ruby modify_before_action.rb daycheck DAYCHECK_ID
call ruby modify_index_method.rb daycheck DAYCHECK_ID
call ruby modify_model.rb daycheck DAYCHECK_ID
