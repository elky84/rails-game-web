json.array!(@log_instances) do |log_instance|
  json.extract! log_instance, :id, :LOG_NO, :USER_NO, :CHARACTER_NO, :LOG_TYPE, :VALUE, :CASH, :MONEY, :USER_LV, :EXP, :ACTION_TIME, :IP
  json.url log_instance_url(log_instance, format: :json)
end
