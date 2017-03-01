json.array!(@monster_infos) do |monster_info|
  json.extract! monster_info, :id, :MONSTER_ID, :MONSTER_TYPE, :MONSTER_GRADE, :GROW_TYPE, :GROW_TYPE_DETAIL, :MONSTER_PRICE, :ACTOR_ID, :SKIN_NUM, :GACHA_SPEECH
  json.url monster_info_url(monster_info, format: :json)
end
