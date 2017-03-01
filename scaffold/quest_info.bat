cd ..\web_server
call rails generate scaffold quest_info  QUEST_INFO_ID:integer:index QUEST_APPLY_TYPE:text GROUP_ID:integer LEVEL_LIMIT:integer NEXT_QUEST_ID:integer QUEST_SCHEDULE_ID:integer QUEST_TYPE_ID:integer QUEST_GRADE_TYPE:text GRADE:integer PREVIEW:text MAXVALUE:integer REWARD:text SHORT_CUT:integer COMPLETE_IMAGE:text COMPLETE_SCENE:text COMPLETE_EXPLAN:text --force
cd ..\scaffold
call ruby modify_create_method.rb quest_info QUEST_INFO_ID
call ruby modify_before_action.rb quest_info QUEST_INFO_ID
call ruby modify_index_method.rb quest_info QUEST_INFO_ID
call ruby modify_model.rb quest_info QUEST_INFO_ID
