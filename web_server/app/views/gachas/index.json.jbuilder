json.array!(@gachas) do |gacha|
  json.extract! gacha, :id, :GACHA_ID, :GACHA_MACHINE_TYPE, :GROUP_ID, :REWARD_PROBABILITY, :GACHA_NAME
  json.url gacha_url(gacha, format: :json)
end
