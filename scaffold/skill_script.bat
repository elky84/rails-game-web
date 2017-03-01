cd ..\web_server
call rails generate scaffold skill_script  SKILL_ID:integer:index CHARACTER_TYPE:text SKILL_CATEGORY:text TYPE:text LEVEL:integer LEARN_LEVEL:integer SKILL_GROUP_ID:integer PRE_SKILL:text PASSIVE_APPLY_SKILL:text LEARN_CONDITION:text ICON:text NAME:text EXPLAIN:text ACTIVE_ID:integer TRIGGER:text SKILL_REACTION_ID:text RANGE_CHECK_REACTION_INDEX:integer SKILL_OPTION_ID:text POWER:text SPEND_MP:text SPEND_HP:text --force
cd ..\scaffold
call ruby modify_create_method.rb skill_script SKILL_ID
call ruby modify_before_action.rb skill_script SKILL_ID
call ruby modify_index_method.rb skill_script SKILL_ID
call ruby modify_model.rb skill_script SKILL_ID
