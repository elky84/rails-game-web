cd ..\web_server
call rails generate scaffold gacha  GACHA_ID:integer:index GACHA_MACHINE_TYPE:integer GROUP_ID:text REWARD_PROBABILITY:text GACHA_NAME:text --force
cd ..\scaffold
call ruby modify_create_method.rb gacha GACHA_ID
call ruby modify_before_action.rb gacha GACHA_ID
call ruby modify_index_method.rb gacha GACHA_ID
call ruby modify_model.rb gacha GACHA_ID
