json.array!(@pvp_periods) do |pvp_period|
  json.extract! pvp_period, :id, :PVP_PERIOD_ID, :SEASON_NUM, :START_DATE, :END_DATE
  json.url pvp_period_url(pvp_period, format: :json)
end
