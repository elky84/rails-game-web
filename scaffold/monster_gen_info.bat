cd ..\web_server
call rails generate scaffold monster_gen_info  INDEX:integer:index APPEAR_TYPE:text POSITION:text MOVE_FROM:text DIRECTION:integer CURVE:integer JUMP_SPEED:text DEAD_AFTER_APPEAR:integer --force
cd ..\scaffold
call ruby modify_create_method.rb monster_gen_info INDEX
call ruby modify_before_action.rb monster_gen_info INDEX
call ruby modify_index_method.rb monster_gen_info INDEX
call ruby modify_model.rb monster_gen_info INDEX
