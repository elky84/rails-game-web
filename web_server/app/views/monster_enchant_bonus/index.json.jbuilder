json.array!(@monster_enchant_bonus) do |monster_enchant_bonu|
  json.extract! monster_enchant_bonu, :id, :MONSTER_TYPE, :STATUS_ID
  json.url monster_enchant_bonu_url(monster_enchant_bonu, format: :json)
end
