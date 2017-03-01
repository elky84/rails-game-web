json.array!(@pvp_rank_cache_instances) do |pvp_rank_cache_instance|
  json.extract! pvp_rank_cache_instance, :id, :PVP_RANK_CACHE_INSTANCE_NO, :RANK, :CHARACTER_NO, :RATING
  json.url pvp_rank_cache_instance_url(pvp_rank_cache_instance, format: :json)
end
