cd ..\web_server
call rails generate scaffold statistics_instance  STATISTICS_NO:integer:index TYPE:text VALUE:integer INFO:text USER_LV:integer DATE:text --force
cd ..\scaffold
call ruby modify_create_method.rb statistics_instance STATISTICS_NO
call ruby modify_before_action.rb statistics_instance STATISTICS_NO
call ruby modify_index_method.rb statistics_instance STATISTICS_NO
call ruby modify_model.rb statistics_instance STATISTICS_NO
