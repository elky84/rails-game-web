cd ..\web_server
call rails generate scaffold coupon  COUPON_INDEX:integer:index REWARD:text COUPON_STRING:text --force
cd ..\scaffold
call ruby modify_create_method.rb coupon COUPON_INDEX
call ruby modify_before_action.rb coupon COUPON_INDEX
call ruby modify_index_method.rb coupon COUPON_INDEX
call ruby modify_model.rb coupon COUPON_INDEX
