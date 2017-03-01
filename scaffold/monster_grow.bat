cd ..\web_server
call rails generate scaffold monster_grow  GROW_ID:integer:index LEVEL:integer GROW_TYPE_DETAIL:text REQUIRE_EXP:integer STATUS_ID:integer --force
cd ..\scaffold
call ruby modify_create_method.rb monster_grow GROW_ID
call ruby modify_before_action.rb monster_grow GROW_ID
call ruby modify_index_method.rb monster_grow GROW_ID
call ruby modify_model.rb monster_grow GROW_ID
