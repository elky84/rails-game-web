cd ..\web_server
call rails generate scaffold item_instance  ITEM_NO:integer:index ITEM_ID:integer USER_NO:integer CHARACTER_NO:integer START_DATE:timestamp END_DATE:timestamp ITEM_NAME:text LEVEL:integer GRADE:integer LIMIT:text VALUE:integer DEFAULT_OPTION:text OPTION_LIST:text SLOT_TYPE:text EXPIRE_TYPE:text DURABILITY:integer ENCHANT:integer --force
cd ..\scaffold
call ruby modify_create_method.rb item_instance ITEM_NO
call ruby modify_before_action.rb item_instance ITEM_NO
call ruby modify_index_method.rb item_instance ITEM_NO
call ruby modify_model.rb item_instance ITEM_NO
