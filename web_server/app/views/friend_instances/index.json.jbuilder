json.array!(@friend_instances) do |friend_instance|
  json.extract! friend_instance, :id, :FRIEND_NO, :USER_NO, :FRIEND_USER_NO, :STATE, :USER_SEND_POINT_DATE, :FRIEND_USER_SEND_POINT_DATE, :USER_ADV_TOGETHER_DATE, :FRIEND_USER_ADV_TOGETHER_DATE, :IS_BOT
  json.url friend_instance_url(friend_instance, format: :json)
end
