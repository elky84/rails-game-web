cd ..\web_server
call rails generate scaffold item_info  ITEM_ID:integer:index ICON:text NAME:text EXPLAIN:text IS_ENCHANT:integer IS_REOPTION:integer IS_SELL:integer LEVEL:integer GRADE:integer LIMIT:text CATEGORY:text COSTUME_ID:integer DEFAULT_OPTION:text ITEM_OPTION_LIST:text PRICE:integer VALUE:integer EXPIRE_TYPE:text DURABILITY:integer --force
cd ..\scaffold
call ruby modify_create_method.rb item_info ITEM_ID
call ruby modify_before_action.rb item_info ITEM_ID
call ruby modify_index_method.rb item_info ITEM_ID
call ruby modify_model.rb item_info ITEM_ID
