json.array!(@event_instances) do |event_instance|
  json.extract! event_instance, :id, :EVENT_NO, :EVENT_TYPE, :REWARD, :START_DATE, :END_DATE
  json.url event_instance_url(event_instance, format: :json)
end
