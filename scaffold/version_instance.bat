cd ..\web_server
call rails generate scaffold version_instance  VALUE:text:index EXPLAIN:text --force
cd ..\scaffold
call ruby modify_create_method.rb version_instance VALUE
call ruby modify_before_action.rb version_instance VALUE
call ruby modify_index_method.rb version_instance VALUE
call ruby modify_model.rb version_instance VALUE
