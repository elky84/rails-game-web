cd ..\web_server
call rails generate scaffold option  OPTION_ID:integer:index CONDITION_ID:integer PARAMETER_ID:text DESCRIPTION:text UI_SCRIPT:text VALUE:text MAX_VALUE:text RANDON_ACTIVITY:integer PERCENT:integer --force
cd ..\scaffold
call ruby modify_create_method.rb option OPTION_ID
call ruby modify_before_action.rb option OPTION_ID
call ruby modify_index_method.rb option OPTION_ID
call ruby modify_model.rb option OPTION_ID
