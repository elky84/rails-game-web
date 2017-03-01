cd ..\web_server
call rails generate scaffold mastery_point_info  MASTERY_POINT:integer:index PRICE_TYPE:text PRICE:integer --force
cd ..\scaffold
call ruby modify_create_method.rb mastery_point_info MASTERY_POINT
call ruby modify_before_action.rb mastery_point_info MASTERY_POINT
call ruby modify_index_method.rb mastery_point_info MASTERY_POINT
call ruby modify_model.rb mastery_point_info MASTERY_POINT
