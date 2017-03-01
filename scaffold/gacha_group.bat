cd ..\web_server
call rails generate scaffold gacha_group  GACHA_GROUP_ID:integer:index GROUP_REWARD:text DESCRIPTION:text --force
cd ..\scaffold
call ruby modify_create_method.rb gacha_group GACHA_GROUP_ID
call ruby modify_before_action.rb gacha_group GACHA_GROUP_ID
call ruby modify_index_method.rb gacha_group GACHA_GROUP_ID
call ruby modify_model.rb gacha_group GACHA_GROUP_ID
