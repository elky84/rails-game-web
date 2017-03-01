json.array!(@mastery_instances) do |mastery_instance|
  json.extract! mastery_instance, :id, :MASTERY_NO, :GROUP_NO, :USER_NO, :CHARACTER_NO, :MASTERY
  json.url mastery_instance_url(mastery_instance, format: :json)
end
