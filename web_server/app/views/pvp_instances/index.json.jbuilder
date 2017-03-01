json.array!(@pvp_instances) do |pvp_instance|
  json.extract! pvp_instance, :id, :CHARACTER_NO, :CHARACTER_LV, :CHARACTER_ID, :COSTUME_ID, :USER_NO, :USER_NICKNAME, :USER_LV, :RATING, :PARTY_ATTACKER, :ATTACKER_POWER, :PARTY_DEFENDER, :DEFENDER_POWER, :SEASON_NUM, :IS_SUCCESSION_VICTORY, :SUCCESSION_COUNT, :VICTORY_COUNT, :DEFEAT_COUNT, :CUR_MATCH_NO, :RANK
  json.url pvp_instance_url(pvp_instance, format: :json)
end
