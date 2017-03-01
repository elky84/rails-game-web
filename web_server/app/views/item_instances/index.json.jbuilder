json.array!(@item_instances) do |item_instance|
  json.extract! item_instance, :id, :ITEM_NO, :ITEM_ID, :USER_NO, :CHARACTER_NO, :START_DATE, :END_DATE, :ITEM_NAME, :LEVEL, :GRADE, :LIMIT, :VALUE, :DEFAULT_OPTION, :OPTION_LIST, :SLOT_TYPE, :EXPIRE_TYPE, :DURABILITY, :ENCHANT
  json.url item_instance_url(item_instance, format: :json)
end
