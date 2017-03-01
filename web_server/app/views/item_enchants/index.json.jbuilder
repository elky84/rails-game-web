json.array!(@item_enchants) do |item_enchant|
  json.extract! item_enchant, :id, :ITEM_ENCHANT_ID, :ITEM_CATEGORY, :LEVEL, :GRADE, :ENCHANT, :ENCHANT_PROBABILITY, :MONEY
  json.url item_enchant_url(item_enchant, format: :json)
end
