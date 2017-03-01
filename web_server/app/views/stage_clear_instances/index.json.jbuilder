json.array!(@stage_clear_instances) do |stage_clear_instance|
  json.extract! stage_clear_instance, :id, :USER_NO, :CHARACTER_NO, :PLAY_STAGE, :CLEAR_STAGE, :STAGE_SCORE, :LAST_DATE
  json.url stage_clear_instance_url(stage_clear_instance, format: :json)
end
