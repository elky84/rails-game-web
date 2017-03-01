cd ..\web_server
call rails generate scaffold user_grow  GROW_ID:integer:index LEVEL:integer REQUIRE_EXP:integer --force
cd ..\scaffold
call ruby modify_create_method.rb user_grow GROW_ID
call ruby modify_before_action.rb user_grow GROW_ID
call ruby modify_index_method.rb user_grow GROW_ID
call ruby modify_model.rb user_grow GROW_ID
