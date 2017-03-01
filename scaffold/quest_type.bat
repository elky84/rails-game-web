cd ..\web_server
call rails generate scaffold quest_type  QUEST_TYPE_ID:integer:index QUEST_ICON:text TYPE:text QUEST_NAME:text QUEST_EXPLAIN:text GUIDE_CHAR_IMAGE:text QUEST_COMPLETE_EXPLAIN:text --force
cd ..\scaffold
call ruby modify_create_method.rb quest_type QUEST_TYPE_ID
call ruby modify_before_action.rb quest_type QUEST_TYPE_ID
call ruby modify_index_method.rb quest_type QUEST_TYPE_ID
call ruby modify_model.rb quest_type QUEST_TYPE_ID
