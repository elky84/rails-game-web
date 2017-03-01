cd ..\web_server
call rails generate scaffold user_give_instance  USER_NO:integer:index GIVE_REPLY:text --force
cd ..\scaffold
call ruby modify_create_method.rb user_give_instance USER_NO
call ruby modify_before_action.rb user_give_instance USER_NO
call ruby modify_index_method.rb user_give_instance USER_NO
call ruby modify_model.rb user_give_instance USER_NO
