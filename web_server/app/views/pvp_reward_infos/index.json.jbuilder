json.array!(@pvp_reward_infos) do |pvp_reward_info|
  json.extract! pvp_reward_info, :id, :PVP_REWARD_ID, :RANGE_TYPE, :MIN, :MAX, :REWARD_TYPE_AND_CAPACITY
  json.url pvp_reward_info_url(pvp_reward_info, format: :json)
end
