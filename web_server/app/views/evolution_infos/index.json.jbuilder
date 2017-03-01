json.array!(@evolution_infos) do |evolution_info|
  json.extract! evolution_info, :id, :EVOLUTION_ID, :GRADE, :RAW, :SPECIAL_MONSTER_LIST, :SPECIAL_SKILL_LIST, :RESULT, :RESULT_PERCENT, :PRICE_COIN, :PRICE_DIAMOND, :EVOLUTION_EVENT_TYPE, :PERCENT_UP, :START_DATE_TIME, :END_DATE_TIME
  json.url evolution_info_url(evolution_info, format: :json)
end
