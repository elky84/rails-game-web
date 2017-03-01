json.array!(@gacha_groups) do |gacha_group|
  json.extract! gacha_group, :id, :GACHA_GROUP_ID, :GROUP_REWARD, :DESCRIPTION
  json.url gacha_group_url(gacha_group, format: :json)
end
