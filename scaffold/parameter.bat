cd ..\web_server
call rails generate scaffold parameter  PARAMETER_ID:integer:index NAME:text DESCRIPTION:text EXPLAIN:text APPLY_STAT:text --force
cd ..\scaffold
call ruby modify_create_method.rb parameter PARAMETER_ID
call ruby modify_before_action.rb parameter PARAMETER_ID
call ruby modify_index_method.rb parameter PARAMETER_ID
call ruby modify_model.rb parameter PARAMETER_ID
