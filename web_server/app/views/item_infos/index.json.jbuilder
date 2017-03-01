json.array!(@item_infos) do |item_info|
  json.extract! item_info, :id, :ITEM_ID, :ICON, :NAME, :EXPLAIN, :IS_ENCHANT, :IS_REOPTION, :IS_SELL, :LEVEL, :GRADE, :LIMIT, :CATEGORY, :COSTUME_ID, :DEFAULT_OPTION, :ITEM_OPTION_LIST, :PRICE, :VALUE, :EXPIRE_TYPE, :DURABILITY
  json.url item_info_url(item_info, format: :json)
end
