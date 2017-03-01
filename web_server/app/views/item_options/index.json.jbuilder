json.array!(@item_options) do |item_option|
  json.extract! item_option, :id, :ITEM_OPTION_ID, :OPTION_ID, :DESCRIPTION, :GRADE, :DETAIL_ID, :MIN, :MAX
  json.url item_option_url(item_option, format: :json)
end
