cd ..\web_server
call rails generate scaffold item_option  ITEM_OPTION_ID:integer:index OPTION_ID:integer DESCRIPTION:text GRADE:text DETAIL_ID:integer MIN:integer MAX:integer --force
cd ..\scaffold
call ruby modify_create_method.rb item_option ITEM_OPTION_ID
call ruby modify_before_action.rb item_option ITEM_OPTION_ID
call ruby modify_index_method.rb item_option ITEM_OPTION_ID
call ruby modify_model.rb item_option ITEM_OPTION_ID
