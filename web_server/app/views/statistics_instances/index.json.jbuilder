json.array!(@statistics_instances) do |statistics_instance|
  json.extract! statistics_instance, :id, :STATISTICS_NO, :TYPE, :VALUE, :INFO, :USER_LV, :DATE
  json.url statistics_instance_url(statistics_instance, format: :json)
end
