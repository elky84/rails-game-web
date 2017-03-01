cd ..\web_server
call rails generate scaffold status  STATUS_ID:integer:index ATTACK:text DEFENSE:text HP:text MP:text RAGE_BASE:text ATTACK_SPEED:text MOVE_SPEED_X:text MOVE_SPEED_Z:text CRITICAL_RATE:text CRITICAL_AVOID:text CRITICAL_DAMAGE:text HIT_RATE:text DODGE_RATE:text HP_REGEN:text MP_REGEN:text RAGE_REGEN:text COOL_TIME_ALL:text RESIST_POISON:text RESIST_SILENCE:text RESIST_STUN:text RESIST_SLOW:text LEVEL:integer --force
cd ..\scaffold
call ruby modify_create_method.rb status STATUS_ID
call ruby modify_before_action.rb status STATUS_ID
call ruby modify_index_method.rb status STATUS_ID
call ruby modify_model.rb status STATUS_ID
