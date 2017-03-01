json.array!(@monster_grows) do |monster_grow|
  json.extract! monster_grow, :id, :GROW_ID, :LEVEL, :GROW_TYPE_DETAIL, :REQUIRE_EXP, :STATUS_ID
  json.url monster_grow_url(monster_grow, format: :json)
end
