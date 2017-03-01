cd ..\web_server
call rails generate scaffold connect_restrict  CONNECT_RESTRICT_ID:integer TYPE:text VALUE:text --force
cd ..\scaffold
call ruby modify_create_method.rb connect_restrict CONNECT_RESTRICT_NO
call ruby modify_before_action.rb connect_restrict CONNECT_RESTRICT_NO
call ruby modify_index_method.rb connect_restrict CONNECT_RESTRICT_NO
call ruby modify_model.rb connect_restrict CONNECT_RESTRICT_NO
