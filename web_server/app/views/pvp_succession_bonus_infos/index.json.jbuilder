json.array!(@pvp_succession_bonus_infos) do |pvp_succession_bonus_info|
  json.extract! pvp_succession_bonus_info, :id, :PVP_SUCCESSION_BONUS_ID, :BONUS_POINT
  json.url pvp_succession_bonus_info_url(pvp_succession_bonus_info, format: :json)
end
