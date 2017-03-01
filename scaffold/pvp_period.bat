cd ..\web_server
call rails generate scaffold pvp_period  PVP_PERIOD_ID:integer:index SEASON_NUM:integer START_DATE:timestamp END_DATE:timestamp --force
cd ..\scaffold
call ruby modify_create_method.rb pvp_period PVP_PERIOD_ID
call ruby modify_before_action.rb pvp_period PVP_PERIOD_ID
call ruby modify_index_method.rb pvp_period PVP_PERIOD_ID
call ruby modify_model.rb pvp_period PVP_PERIOD_ID
