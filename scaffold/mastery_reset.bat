cd ..\web_server
call rails generate scaffold mastery_reset  MASTERY_RESET_ID:integer:index COST:text --force
cd ..\scaffold
call ruby modify_create_method.rb mastery_reset MASTERY_RESET_ID
call ruby modify_before_action.rb mastery_reset MASTERY_RESET_ID
call ruby modify_index_method.rb mastery_reset MASTERY_RESET_ID
call ruby modify_model.rb mastery_reset MASTERY_RESET_ID
