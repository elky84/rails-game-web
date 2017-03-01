json.array!(@coupon_instances) do |coupon_instance|
  json.extract! coupon_instance, :id, :COUPON_INDEX, :REWARD, :COUPON_STRING, :SERVER_INDEX, :USER_NO, :TIME, :COUPON_GROUP
  json.url coupon_instance_url(coupon_instance, format: :json)
end
