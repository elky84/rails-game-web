json.array!(@daycheck_instances) do |daycheck_instance|
  json.extract! daycheck_instance, :id, :DAYCHECK_NO, :USER_NO, :USER_TYPE, :DAYCHECK_ID, :TIME, :CHECK
  json.url daycheck_instance_url(daycheck_instance, format: :json)
end
