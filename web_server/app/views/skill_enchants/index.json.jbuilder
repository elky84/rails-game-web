json.array!(@skill_enchants) do |skill_enchant|
  json.extract! skill_enchant, :id, :SKILL_ENCHANT_ID, :ENCHANT_NUM, :MONSTER_GRADE, :ENCHANT_RESULT, :ENCHANT_PERCENT, :EQUAL_MONSTER_BONUS, :MONEY
  json.url skill_enchant_url(skill_enchant, format: :json)
end
