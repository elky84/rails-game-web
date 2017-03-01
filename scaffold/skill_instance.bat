cd ..\web_server
call rails generate scaffold skill_instance  SKILL_NO:integer:index CHARACTER_NO:integer SKILL_ID:integer SKILL_LEVEL:integer SLOT_NO:integer --force
cd ..\scaffold
call ruby modify_create_method.rb skill_instance SKILL_NO
call ruby modify_before_action.rb skill_instance SKILL_NO
call ruby modify_index_method.rb skill_instance SKILL_NO
call ruby modify_model.rb skill_instance SKILL_NO
