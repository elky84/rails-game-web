cd ..\web_server
call rails generate scaffold stage_clear_instance  USER_NO:integer CHARACTER_NO:integer:index PLAY_STAGE:text CLEAR_STAGE:text STAGE_SCORE:text LAST_DATE:timestamp --force
cd ..\scaffold
call ruby modify_create_method.rb stage_clear_instance CHARACTER_NO
call ruby modify_before_action.rb stage_clear_instance CHARACTER_NO
call ruby modify_index_method.rb stage_clear_instance CHARACTER_NO
call ruby modify_model.rb stage_clear_instance CHARACTER_NO
