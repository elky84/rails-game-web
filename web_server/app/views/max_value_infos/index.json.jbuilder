json.array!(@max_value_infos) do |max_value_info|
  json.extract! max_value_info, :id, :MAX_VALUE_ID, :MAX_SLOT_TYPE, :EXT_SLOT, :NEXT_EXT_SLOT, :NEXT_COST
  json.url max_value_info_url(max_value_info, format: :json)
end
