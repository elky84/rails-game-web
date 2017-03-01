json.array!(@character_grows) do |character_grow|
  json.extract! character_grow, :id, :GROW_ID, :LEVEL, :GROW_TYPE_DETAIL, :REQUIRE_EXP, :STATUS_ID
  json.url character_grow_url(character_grow, format: :json)
end
