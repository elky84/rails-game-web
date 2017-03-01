json.array!(@tutorial_instances) do |tutorial_instance|
  json.extract! tutorial_instance, :id, :TUTORIAL_NO, :USER_NO, :FLOW_NO, :GACHA_GET_INSTANCE_NO, :STAGE_GET_INSTANCE_NO
  json.url tutorial_instance_url(tutorial_instance, format: :json)
end
