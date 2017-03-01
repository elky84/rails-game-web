json.array!(@area_infos) do |area_info|
  json.extract! area_info, :id, :AREA_ID, :OPEN, :START_DATE, :END_DATE, :AREA_TYPE, :BG_COLOR, :NAME, :EXPLAIN, :CHARACTER_LEVEL, :IMAGE, :MISSION, :MONSTER, :ITEM, :SCENARIO_START, :SCENARIO_END
  json.url area_info_url(area_info, format: :json)
end
