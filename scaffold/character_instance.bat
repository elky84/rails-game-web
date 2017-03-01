cd ..\web_server
call rails generate scaffold character_instance  CHARACTER_NO:integer:index USER_NO:integer CHARACTER_ID:integer LEVEL:integer EXP:integer LASTEST_ACTIVE_TIME:timestamp MASTERY_GROUP_ID:integer PARTY_MONSTER_ID:text STAGE_INSTANCE_NO:integer COSTUME_ID:integer --force
cd ..\scaffold
call ruby modify_create_method.rb character_instance CHARACTER_NO
call ruby modify_before_action.rb character_instance CHARACTER_NO
call ruby modify_index_method.rb character_instance CHARACTER_NO
call ruby modify_model.rb character_instance CHARACTER_NO
