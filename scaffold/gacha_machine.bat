cd ..\web_server
call rails generate scaffold gacha_machine  GACHA_MACHINE_ID:integer:index GACHA_MACHINE_TYPE:text --force
cd ..\scaffold
call ruby modify_create_method.rb gacha_machine GACHA_MACHINE_ID
call ruby modify_before_action.rb gacha_machine GACHA_MACHINE_ID
call ruby modify_index_method.rb gacha_machine GACHA_MACHINE_ID
call ruby modify_model.rb gacha_machine GACHA_MACHINE_ID
