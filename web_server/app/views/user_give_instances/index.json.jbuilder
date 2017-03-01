json.array!(@user_give_instances) do |user_give_instance|
  json.extract! user_give_instance, :id, :USER_NO, :GIVE_REPLY
  json.url user_give_instance_url(user_give_instance, format: :json)
end
