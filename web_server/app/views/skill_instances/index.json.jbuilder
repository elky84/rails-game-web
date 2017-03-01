json.array!(@skill_instances) do |skill_instance|
  json.extract! skill_instance, :id, :SKILL_NO, :CHARACTER_NO, :SKILL_ID, :SKILL_LEVEL, :SLOT_NO
  json.url skill_instance_url(skill_instance, format: :json)
end
