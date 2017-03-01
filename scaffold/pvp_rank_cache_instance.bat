cd ..\web_server
call rails generate scaffold pvp_rank_cache_instance  PVP_RANK_CACHE_INSTANCE_NO:integer:index RANK:integer CHARACTER_NO:integer RATING:integer --force
cd ..\scaffold
call ruby modify_create_method.rb pvp_rank_cache_instance PVP_RANK_CACHE_INSTANCE_NO
call ruby modify_before_action.rb pvp_rank_cache_instance PVP_RANK_CACHE_INSTANCE_NO
call ruby modify_index_method.rb pvp_rank_cache_instance PVP_RANK_CACHE_INSTANCE_NO
call ruby modify_model.rb pvp_rank_cache_instance PVP_RANK_CACHE_INSTANCE_NO
