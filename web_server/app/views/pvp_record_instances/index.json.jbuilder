json.array!(@pvp_record_instances) do |pvp_record_instance|
  json.extract! pvp_record_instance, :id, :PVP_RECORD_INSTANCE_NO, :SEASON_NUM, :CHARACTER_NO, :RESULT, :RESULT_TIME, :ADD_RATING, :RESULT_RATING, :MATCH_CHARACTER_NO, :MATCH_CHR_LV, :MATCH_CHR_ID, :MATCH_USER_NICKNAME, :MATCH_USER_LV, :MATCH_CHR_DEF_POWER, :MATCH_MONSTER_ID, :MATCH_MONSTER_LV
  json.url pvp_record_instance_url(pvp_record_instance, format: :json)
end
