cd ..\web_server
call rails generate scaffold report_instance  REPORT_NO:integer:index USER_NO:integer CHARACTER_NO:integer REPORT_TYPE:text VALUE:text USER_LV:integer EXP:integer ACTION_TIME:timestamp IP:text --force
cd ..\scaffold
call ruby modify_create_method.rb report_instance REPORT_NO
call ruby modify_before_action.rb report_instance REPORT_NO
call ruby modify_index_method.rb report_instance REPORT_NO
call ruby modify_model.rb report_instance REPORT_NO
