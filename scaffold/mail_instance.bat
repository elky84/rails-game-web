cd ..\web_server
call rails generate scaffold mail_instance  MAIL_NO:integer:index USER_NO:integer TITLE:text CONTENT:text SENDER:text SENDER_ACTOR_ID:integer SENDER_USER_NO:integer OPENED:text REWARD:text END_DATE:timestamp MAIL_TYPE:text --force
cd ..\scaffold
call ruby modify_create_method.rb mail_instance MAIL_NO
call ruby modify_before_action.rb mail_instance MAIL_NO
call ruby modify_index_method.rb mail_instance MAIL_NO
call ruby modify_model.rb mail_instance MAIL_NO
