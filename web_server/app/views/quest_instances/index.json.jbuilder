json.array!(@quest_instances) do |quest_instance|
  json.extract! quest_instance, :id, :QUEST_NO, :TYPE, :QUEST_INFO_ID, :USER_NO, :QUEST_VALUE, :ACTIVE_TIME, :CLEAR, :CLEAR_TIME, :QUEST_APPLY_TYPE, :GRADE, :GROUP_ID
  json.url quest_instance_url(quest_instance, format: :json)
end
