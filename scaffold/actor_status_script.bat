cd ..\web_server
call rails generate scaffold actor_status_script  index:integer:index SKILL_TYPE:text scale_x:text scale_y:text spine_name:text ui_sprite_name:text actor_name:text skill_list:text random_skill_list:text random_skill_percent:text shadow:integer shadow_scale_x:text shadow_scale_y:text attack_count_max:integer ai_index:integer die_animation_curve:integer die_animation_lenth:text die_animation_speed:text HP:text MP:text ATTACK:text DEFENCE:text HIT:text AVOID:text CRITICAL_HIT:text CRITICAL_AVOID:text CRITICAL_DAMAGE_PERCENT:text REGEN_HEALTH:text REGEN_MP:text MOVE_SPEED_X:text MOVE_SPEED_Z:text ATTACK_SPEED:text RAGE_BASE:text RAGE_REGEN:text COOL_TIME_ALL:text RESIST_POISON:text RESIST_SILENCE:text RESIST_STUN:text RESIST_SLOW:text LEVEL:integer VOICE:text OTHER_IDLE_USE:text actor_group_id:integer group_rank_id:integer special_skill:text special_skill_percent:text DOWN_TIME:text home_ani:text --force
cd ..\scaffold
call ruby modify_create_method.rb actor_status_script index
call ruby modify_before_action.rb actor_status_script index
call ruby modify_index_method.rb actor_status_script index
call ruby modify_model.rb actor_status_script index
