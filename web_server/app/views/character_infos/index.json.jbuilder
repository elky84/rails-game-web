json.array!(@character_infos) do |character_info|
  json.extract! character_info, :id, :CHARACTER_ID, :TYPE, :GROW_TYPE_DETAIL, :EQUIP_TYPE, :NAME, :EXPLAIN, :ACTOR_ID, :PRICE, :RELEASE
  json.url character_info_url(character_info, format: :json)
end
