cd ..\web_server
call rails generate scaffold monster_info  MONSTER_ID:integer:index MONSTER_TYPE:text MONSTER_GRADE:integer GROW_TYPE:text GROW_TYPE_DETAIL:text MONSTER_PRICE:integer ACTOR_ID:integer SKIN_NUM:integer GACHA_SPEECH:text --force
cd ..\scaffold
call ruby modify_create_method.rb monster_info MONSTER_ID
call ruby modify_before_action.rb monster_info MONSTER_ID
call ruby modify_index_method.rb monster_info MONSTER_ID
call ruby modify_model.rb monster_info MONSTER_ID
