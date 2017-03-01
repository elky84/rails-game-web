json.array!(@report_instances) do |report_instance|
  json.extract! report_instance, :id, :REPORT_NO, :USER_NO, :CHARACTER_NO, :REPORT_TYPE, :VALUE, :USER_LV, :EXP, :ACTION_TIME, :IP
  json.url report_instance_url(report_instance, format: :json)
end
