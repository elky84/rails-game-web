cd ..\web_server
call rails generate scaffold item_enchant_effect  ITEM_ENCHANT_EFFECT_ID:integer:index ITEM_CATEGORY:text LEVEL:integer GRADE:integer ENCHANT:integer BASIC_EFFECT:text BONUS_EFFECT:text --force
cd ..\scaffold
call ruby modify_create_method.rb item_enchant_effect ITEM_ENCHANT_EFFECT_ID
call ruby modify_before_action.rb item_enchant_effect ITEM_ENCHANT_EFFECT_ID
call ruby modify_index_method.rb item_enchant_effect ITEM_ENCHANT_EFFECT_ID
call ruby modify_model.rb item_enchant_effect ITEM_ENCHANT_EFFECT_ID
