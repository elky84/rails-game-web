json.array!(@character_instances) do |character_instance|
  json.extract! character_instance, :id, :CHARACTER_NO, :USER_NO, :CHARACTER_ID, :LEVEL, :EXP, :LASTEST_ACTIVE_TIME, :MASTERY_GROUP_ID, :PARTY_MONSTER_ID, :STAGE_INSTANCE_NO, :COSTUME_ID
  json.url character_instance_url(character_instance, format: :json)
end
