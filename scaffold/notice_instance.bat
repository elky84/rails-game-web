cd ..\web_server
call rails generate scaffold notice_instance  NOTICE_NO:integer:index NOTICE_TYPE:text CONTENT:text START_DATE:timestamp END_DATE:timestamp --force
cd ..\scaffold
call ruby modify_create_method.rb notice_instance NOTICE_NO
call ruby modify_before_action.rb notice_instance NOTICE_NO
call ruby modify_index_method.rb notice_instance NOTICE_NO
call ruby modify_model.rb notice_instance NOTICE_NO
