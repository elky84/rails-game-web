json.array!(@quest_short_cuts) do |quest_short_cut|
  json.extract! quest_short_cut, :id, :SHORT_CUT_NO, :SHORT_CUT_TYPE
  json.url quest_short_cut_url(quest_short_cut, format: :json)
end
