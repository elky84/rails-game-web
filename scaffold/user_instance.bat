cd ..\web_server
call rails generate scaffold user_instance  USER_NO:integer:index USER_ID:text USER_LV:integer EXP:integer NICKNAME:text CASH:integer MONEY:integer STAMINA_ADVENTURE_TIME:timestamp STAMINA_ADVENTURE:integer STAMINA_SPECIAL_TIME:timestamp STAMINA_SPECIAL:integer STAMINA_PVP_TIME:timestamp STAMINA_PVP:integer FRIEND_POINT:integer POSTBOX_SLOT:integer CACHE_MONSTER_SLOT:integer EXT_MONSTER_SLOT:integer CACHE_ITEM_SLOT:integer EXT_ITEM_SLOT:integer CACHE_FRIEND_SLOT:integer EXT_FRIEND_COUNT:integer MASTERY_RESET_COUNT:integer LASTEST_ACTIVE_TIME:timestamp PERMISSION:text LASTEST_CHR_ID:integer LASTEST_CHR_LV:integer MASTERY_POINT:integer INFI_TOWER_FLOOR:integer FRIEND_DELETE_COUNT:integer --force
cd ..\scaffold
call ruby modify_create_method.rb user_instance USER_NO
call ruby modify_before_action.rb user_instance USER_NO
call ruby modify_index_method.rb user_instance USER_NO
call ruby modify_model.rb user_instance USER_NO
