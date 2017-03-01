json.array!(@connect_restricts) do |connect_restrict|
  json.extract! connect_restrict, :id, :CONNECT_RESTRICT_ID, :TYPE, :VALUE
  json.url connect_restrict_url(connect_restrict, format: :json)
end
