json.array!(@pvp_ranges) do |pvp_range|
  json.extract! pvp_range, :id, :PVP_RANGE_ID, :RATING, :RANK, :ADD_RANK
  json.url pvp_range_url(pvp_range, format: :json)
end
