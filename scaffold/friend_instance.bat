cd ..\web_server
call rails generate scaffold friend_instance  FRIEND_NO:integer:index USER_NO:integer FRIEND_USER_NO:integer STATE:integer USER_SEND_POINT_DATE:timestamp FRIEND_USER_SEND_POINT_DATE:timestamp USER_ADV_TOGETHER_DATE:timestamp FRIEND_USER_ADV_TOGETHER_DATE:timestamp IS_BOT:integer --force
cd ..\scaffold
call ruby modify_create_method.rb friend_instance FRIEND_NO
call ruby modify_before_action.rb friend_instance FRIEND_NO
call ruby modify_index_method.rb friend_instance FRIEND_NO
call ruby modify_model.rb friend_instance FRIEND_NO
