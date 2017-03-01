cd ..\web_server
call rails generate scaffold monster_instance  MONSTER_NO:integer:index USER_NO:integer CHARACTER_NO:integer MONSTER_ID:integer GROW_TYPE_DETAIL:text LEVEL:integer EXP:integer SKILL:text TEAM_SLOT:integer NEW:integer --force
cd ..\scaffold
call ruby modify_create_method.rb monster_instance MONSTER_NO
call ruby modify_before_action.rb monster_instance MONSTER_NO
call ruby modify_index_method.rb monster_instance MONSTER_NO
call ruby modify_model.rb monster_instance MONSTER_NO
