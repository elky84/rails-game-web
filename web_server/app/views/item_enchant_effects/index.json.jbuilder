json.array!(@item_enchant_effects) do |item_enchant_effect|
  json.extract! item_enchant_effect, :id, :ITEM_ENCHANT_EFFECT_ID, :ITEM_CATEGORY, :LEVEL, :GRADE, :ENCHANT, :BASIC_EFFECT, :BONUS_EFFECT
  json.url item_enchant_effect_url(item_enchant_effect, format: :json)
end
