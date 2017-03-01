cd ..\web_server
call rails generate scaffold max_value_info  MAX_VALUE_ID:integer:index MAX_SLOT_TYPE:text EXT_SLOT:integer NEXT_EXT_SLOT:integer NEXT_COST:text --force
cd ..\scaffold
call ruby modify_create_method.rb max_value_info MAX_VALUE_ID
call ruby modify_before_action.rb max_value_info MAX_VALUE_ID
call ruby modify_index_method.rb max_value_info MAX_VALUE_ID
call ruby modify_model.rb max_value_info MAX_VALUE_ID
