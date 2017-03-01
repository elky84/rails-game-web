json.array!(@notice_instances) do |notice_instance|
  json.extract! notice_instance, :id, :NOTICE_NO, :NOTICE_TYPE, :CONTENT, :START_DATE, :END_DATE
  json.url notice_instance_url(notice_instance, format: :json)
end
