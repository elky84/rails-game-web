json.array!(@monster_gen_infos) do |monster_gen_info|
  json.extract! monster_gen_info, :id, :INDEX, :APPEAR_TYPE, :POSITION, :MOVE_FROM, :DIRECTION, :CURVE, :JUMP_SPEED, :DEAD_AFTER_APPEAR
  json.url monster_gen_info_url(monster_gen_info, format: :json)
end
