cd ..\web_server
call rails generate scaffold item_reoption  ITEM_REOPTION_ID:integer:index ITEM_CATEGORY:text LEVEL:integer GRADE:integer MONEY:text --force
cd ..\scaffold
call ruby modify_create_method.rb item_reoption ITEM_REOPTION_ID
call ruby modify_before_action.rb item_reoption ITEM_REOPTION_ID
call ruby modify_index_method.rb item_reoption ITEM_REOPTION_ID
call ruby modify_model.rb item_reoption ITEM_REOPTION_ID
