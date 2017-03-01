json.array!(@conditions) do |condition|
  json.extract! condition, :id, :CONDITION_ID, :CONDITION_EFFECT, :CONDITION_INFO, :PERCENT, :CONDITION_APPLY_TYPE
  json.url condition_url(condition, format: :json)
end
