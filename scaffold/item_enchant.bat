cd ..\web_server
call rails generate scaffold item_enchant  ITEM_ENCHANT_ID:integer:index ITEM_CATEGORY:text LEVEL:integer GRADE:integer ENCHANT:integer ENCHANT_PROBABILITY:text MONEY:integer --force
cd ..\scaffold
call ruby modify_create_method.rb item_enchant ITEM_ENCHANT_ID
call ruby modify_before_action.rb item_enchant ITEM_ENCHANT_ID
call ruby modify_index_method.rb item_enchant ITEM_ENCHANT_ID
call ruby modify_model.rb item_enchant ITEM_ENCHANT_ID
