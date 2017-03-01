cd ..\web_server
call rails generate scaffold pvp_reward_info  PVP_REWARD_ID:integer:index RANGE_TYPE:text MIN:integer MAX:integer REWARD_TYPE_AND_CAPACITY:text --force
cd ..\scaffold
call ruby modify_create_method.rb pvp_reward_info PVP_REWARD_ID
call ruby modify_before_action.rb pvp_reward_info PVP_REWARD_ID
call ruby modify_index_method.rb pvp_reward_info PVP_REWARD_ID
call ruby modify_model.rb pvp_reward_info PVP_REWARD_ID
