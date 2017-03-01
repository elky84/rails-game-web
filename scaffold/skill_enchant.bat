cd ..\web_server
call rails generate scaffold skill_enchant  SKILL_ENCHANT_ID:integer:index ENCHANT_NUM:integer MONSTER_GRADE:integer ENCHANT_RESULT:text ENCHANT_PERCENT:text EQUAL_MONSTER_BONUS:text MONEY:integer --force
cd ..\scaffold
call ruby modify_create_method.rb skill_enchant SKILL_ENCHANT_ID
call ruby modify_before_action.rb skill_enchant SKILL_ENCHANT_ID
call ruby modify_index_method.rb skill_enchant SKILL_ENCHANT_ID
call ruby modify_model.rb skill_enchant SKILL_ENCHANT_ID
