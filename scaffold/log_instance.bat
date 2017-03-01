cd ..\web_server
call rails generate scaffold log_instance  LOG_NO:integer:index USER_NO:integer CHARACTER_NO:integer LOG_TYPE:text VALUE:text CASH:integer MONEY:integer USER_LV:integer EXP:integer ACTION_TIME:timestamp IP:text --force
cd ..\scaffold
call ruby modify_create_method.rb log_instance LOG_NO
call ruby modify_before_action.rb log_instance LOG_NO
call ruby modify_index_method.rb log_instance LOG_NO
call ruby modify_model.rb log_instance LOG_NO
