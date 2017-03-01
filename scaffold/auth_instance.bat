cd ..\web_server
call rails generate scaffold auth_instance  USER_NO:integer:index PRIVATE_KEY:text IP:text AUTH_KEY:text --force
cd ..\scaffold
call ruby modify_create_method.rb auth_instance USER_NO
call ruby modify_before_action.rb auth_instance USER_NO
call ruby modify_index_method.rb auth_instance USER_NO
call ruby modify_model.rb auth_instance USER_NO
