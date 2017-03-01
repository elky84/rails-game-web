cd ..\web_server
call rails generate scaffold event_instance  EVENT_NO:integer:index EVENT_TYPE:text REWARD:text START_DATE:timestamp END_DATE:timestamp --force
cd ..\scaffold
call ruby modify_create_method.rb event_instance EVENT_NO
call ruby modify_before_action.rb event_instance EVENT_NO
call ruby modify_index_method.rb event_instance EVENT_NO
call ruby modify_model.rb event_instance EVENT_NO
