json.array!(@parameters) do |parameter|
  json.extract! parameter, :id, :PARAMETER_ID, :NAME, :DESCRIPTION, :EXPLAIN, :APPLY_STAT
  json.url parameter_url(parameter, format: :json)
end
