json.array!(@quest_infos) do |quest_info|
  json.extract! quest_info, :id, :QUEST_INFO_ID, :QUEST_APPLY_TYPE, :GROUP_ID, :LEVEL_LIMIT, :NEXT_QUEST_ID, :QUEST_SCHEDULE_ID, :QUEST_TYPE_ID, :QUEST_GRADE_TYPE, :GRADE, :PREVIEW, :MAXVALUE, :REWARD, :SHORT_CUT, :COMPLETE_IMAGE, :COMPLETE_SCENE, :COMPLETE_EXPLAN
  json.url quest_info_url(quest_info, format: :json)
end
