cd ..\web_server
call rails generate scaffold monster_enchant_bonus  MONSTER_TYPE:text:index STATUS_ID:integer --force
cd ..\scaffold
call ruby modify_create_method.rb monster_enchant_bonus MONSTER_TYPE
call ruby modify_before_action.rb monster_enchant_bonus MONSTER_TYPE
call ruby modify_index_method.rb monster_enchant_bonus MONSTER_TYPE
call ruby modify_model.rb monster_enchant_bonus MONSTER_TYPE
