json.array!(@server_lists) do |server_list|
  json.extract! server_list, :id, :INDEX, :SERVER_TYPE, :ADDRESS, :NAME, :CU, :RU
  json.url server_list_url(server_list, format: :json)
end
