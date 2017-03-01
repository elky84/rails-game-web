cd ..\web_server
call rails generate scaffold character_info  CHARACTER_ID:integer:index TYPE:text GROW_TYPE_DETAIL:text EQUIP_TYPE:text NAME:text EXPLAIN:text ACTOR_ID:integer PRICE:integer RELEASE:integer --force
cd ..\scaffold
call ruby modify_create_method.rb character_info CHARACTER_ID
call ruby modify_before_action.rb character_info CHARACTER_ID
call ruby modify_index_method.rb character_info CHARACTER_ID
call ruby modify_model.rb character_info CHARACTER_ID
