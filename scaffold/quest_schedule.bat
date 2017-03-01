cd ..\web_server
call rails generate scaffold quest_schedule  QUEST_SCHEDULE_ID:integer:index QUEST_SCHEDULE_TYPE:text ODD_OR_EVEN:text START:timestamp END:timestamp EXPLAIN:text --force
cd ..\scaffold
call ruby modify_create_method.rb quest_schedule QUEST_SCHEDULE_ID
call ruby modify_before_action.rb quest_schedule QUEST_SCHEDULE_ID
call ruby modify_index_method.rb quest_schedule QUEST_SCHEDULE_ID
call ruby modify_model.rb quest_schedule QUEST_SCHEDULE_ID
