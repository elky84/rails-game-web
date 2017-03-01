cd ..\web_server
call rails generate scaffold quest_instance  QUEST_NO:integer:index TYPE:text QUEST_INFO_ID:integer USER_NO:integer QUEST_VALUE:integer ACTIVE_TIME:timestamp CLEAR:text CLEAR_TIME:timestamp QUEST_APPLY_TYPE:text GRADE:integer GROUP_ID:integer --force
cd ..\scaffold
call ruby modify_create_method.rb quest_instance QUEST_NO
call ruby modify_before_action.rb quest_instance QUEST_NO
call ruby modify_index_method.rb quest_instance QUEST_NO
call ruby modify_model.rb quest_instance QUEST_NO
