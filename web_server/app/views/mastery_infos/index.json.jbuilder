json.array!(@mastery_infos) do |mastery_info|
  json.extract! mastery_info, :id, :MASTERY_ID, :MASTERY_TYPE, :GRADE, :NAME, :EXPLAIN, :MAX_LEVEL, :OPTION_ID, :OPTION_EFFECT, :EFFECT_TARGET, :PRE_LEVEL, :PRE_CONDITION, :ICON
  json.url mastery_info_url(mastery_info, format: :json)
end
