cd ..\web_server
call rails generate scaffold tutorial_instance  TUTORIAL_NO:integer:index USER_NO:integer FLOW_NO:text GACHA_GET_INSTANCE_NO:integer STAGE_GET_INSTANCE_NO:integer --force
cd ..\scaffold
call ruby modify_create_method.rb tutorial_instance TUTORIAL_NO
call ruby modify_before_action.rb tutorial_instance TUTORIAL_NO
call ruby modify_index_method.rb tutorial_instance TUTORIAL_NO
call ruby modify_model.rb tutorial_instance TUTORIAL_NO
