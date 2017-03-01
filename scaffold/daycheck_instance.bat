cd ..\web_server
call rails generate scaffold daycheck_instance  DAYCHECK_NO:integer USER_NO:integer USER_TYPE:integer DAYCHECK_ID:integer:index TIME:text CHECK:integer --force
cd ..\scaffold
call ruby modify_create_method.rb daycheck_instance DAYCHECK_ID
call ruby modify_before_action.rb daycheck_instance DAYCHECK_ID
call ruby modify_index_method.rb daycheck_instance DAYCHECK_ID
call ruby modify_model.rb daycheck_instance DAYCHECK_ID
