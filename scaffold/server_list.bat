cd ..\web_server
call rails generate scaffold server_list  INDEX:integer:index SERVER_TYPE:text ADDRESS:text NAME:text CU:integer RU:integer --force
cd ..\scaffold
call ruby modify_create_method.rb server_list INDEX
call ruby modify_before_action.rb server_list INDEX
call ruby modify_index_method.rb server_list INDEX
call ruby modify_model.rb server_list INDEX
