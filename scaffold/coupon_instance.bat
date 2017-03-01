cd ..\web_server
call rails generate scaffold coupon_instance  COUPON_INDEX:integer:index REWARD:text COUPON_STRING:text SERVER_INDEX:integer USER_NO:integer TIME:text COUPON_GROUP:text --force
cd ..\scaffold
call ruby modify_create_method.rb coupon_instance COUPON_INDEX
call ruby modify_before_action.rb coupon_instance COUPON_INDEX
call ruby modify_index_method.rb coupon_instance COUPON_INDEX
call ruby modify_model.rb coupon_instance COUPON_INDEX
