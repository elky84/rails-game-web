json.array!(@quest_types) do |quest_type|
  json.extract! quest_type, :id, :QUEST_TYPE_ID, :QUEST_ICON, :TYPE, :QUEST_NAME, :QUEST_EXPLAIN, :GUIDE_CHAR_IMAGE, :QUEST_COMPLETE_EXPLAIN
  json.url quest_type_url(quest_type, format: :json)
end
