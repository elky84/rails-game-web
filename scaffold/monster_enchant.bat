cd ..\web_server
call rails generate scaffold monster_enchant  MONSTER_ENCHANT_ID:integer:index MONSTER_GRADE:integer ENCHANT_RESULT:text ENCHANT_PERCENT:text EQUAL_MONSTER_SKILL_BONUS:text BASE_EXP:text LEVEL_BONUS_EXP:text EQUAL_MONSTER_EXP_BONUS:text BASE_MONEY:integer LEVEL_MONEY:integer --force
cd ..\scaffold
call ruby modify_create_method.rb monster_enchant MONSTER_ENCHANT_ID
call ruby modify_before_action.rb monster_enchant MONSTER_ENCHANT_ID
call ruby modify_index_method.rb monster_enchant MONSTER_ENCHANT_ID
call ruby modify_model.rb monster_enchant MONSTER_ENCHANT_ID
