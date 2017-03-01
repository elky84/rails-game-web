cd ..\web_server
call rails generate scaffold monster_grade_bonus  GRADE:integer:index STATUS_ID:integer --force
cd ..\scaffold
call ruby modify_create_method.rb monster_grade_bonus GRADE
call ruby modify_before_action.rb monster_grade_bonus GRADE
call ruby modify_index_method.rb monster_grade_bonus GRADE
call ruby modify_model.rb monster_grade_bonus GRADE
