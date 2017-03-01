json.array!(@mastery_point_infos) do |mastery_point_info|
  json.extract! mastery_point_info, :id, :MASTERY_POINT, :PRICE_TYPE, :PRICE
  json.url mastery_point_info_url(mastery_point_info, format: :json)
end
