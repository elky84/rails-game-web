json.array!(@monster_enchants) do |monster_enchant|
  json.extract! monster_enchant, :id, :MONSTER_ENCHANT_ID, :MONSTER_GRADE, :ENCHANT_RESULT, :ENCHANT_PERCENT, :EQUAL_MONSTER_SKILL_BONUS, :BASE_EXP, :LEVEL_BONUS_EXP, :EQUAL_MONSTER_EXP_BONUS, :BASE_MONEY, :LEVEL_MONEY
  json.url monster_enchant_url(monster_enchant, format: :json)
end
