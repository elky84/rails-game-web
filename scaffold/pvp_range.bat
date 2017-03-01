cd ..\web_server
call rails generate scaffold pvp_range  PVP_RANGE_ID:integer:index RATING:integer RANK:integer ADD_RANK:integer --force
cd ..\scaffold
call ruby modify_create_method.rb pvp_range PVP_RANGE_ID
call ruby modify_before_action.rb pvp_range PVP_RANGE_ID
call ruby modify_index_method.rb pvp_range PVP_RANGE_ID
call ruby modify_model.rb pvp_range PVP_RANGE_ID
