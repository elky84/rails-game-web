json.array!(@item_reoptions) do |item_reoption|
  json.extract! item_reoption, :id, :ITEM_REOPTION_ID, :ITEM_CATEGORY, :GRADE, :LEVEL, :MONEY
  json.url item_reoption_url(item_reoption, format: :json)
end
