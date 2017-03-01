cd ..\web_server
call rails generate scaffold shop_item  SHOP_ITEM_ID:integer:index HIDE:integer GIFT:integer STORE:text ICON:text PRICE_TYPE:text CHARACTER_LEVEL:integer PRICE:integer SHOP_CATEGORY:text CAPACITY:integer ITEM_ID:integer GACHA:integer BONUS_STRING:text BONUS_ID:text NAME:text EXPLAIN:text START_DATE:timestamp END_DATE:timestamp NSTORE_PID:text PLAY_PID:text --force
cd ..\scaffold
call ruby modify_create_method.rb shop_item SHOP_ITEM_ID
call ruby modify_before_action.rb shop_item SHOP_ITEM_ID
call ruby modify_index_method.rb shop_item SHOP_ITEM_ID
call ruby modify_model.rb shop_item SHOP_ITEM_ID
