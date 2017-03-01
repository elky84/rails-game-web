json.array!(@stage_instances) do |stage_instance|
  json.extract! stage_instance, :id, :STAGE_PROGRESS_NO, :USER_NO, :CHARACTER_NO, :PARTY_MONSTER_ID, :STAGE_ID, :CLEAR_EXP_NO, :CLEAR_MONEY_NO, :CLEAR_REWARD_NO, :START_DATE
  json.url stage_instance_url(stage_instance, format: :json)
end
