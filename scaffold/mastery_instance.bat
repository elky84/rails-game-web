cd ..\web_server
call rails generate scaffold mastery_instance  MASTERY_NO:integer GROUP_NO:integer:index USER_NO:integer CHARACTER_NO:integer MASTERY:text --force
cd ..\scaffold
call ruby modify_create_method.rb mastery_instance GROUP_NO
call ruby modify_before_action.rb mastery_instance GROUP_NO
call ruby modify_index_method.rb mastery_instance GROUP_NO
call ruby modify_model.rb mastery_instance GROUP_NO
