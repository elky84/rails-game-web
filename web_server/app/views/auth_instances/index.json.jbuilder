json.array!(@auth_instances) do |auth_instance|
  json.extract! auth_instance, :id, :USER_NO, :PRIVATE_KEY, :IP, :AUTH_KEY
  json.url auth_instance_url(auth_instance, format: :json)
end
