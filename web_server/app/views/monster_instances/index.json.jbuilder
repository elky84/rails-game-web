json.array!(@monster_instances) do |monster_instance|
  json.extract! monster_instance, :id, :MONSTER_NO, :USER_NO, :CHARACTER_NO, :MONSTER_ID, :GROW_TYPE_DETAIL, :LEVEL, :EXP, :SKILL, :TEAM_SLOT, :NEW
  json.url monster_instance_url(monster_instance, format: :json)
end
