json.array!(@version_instances) do |version_instance|
  json.extract! version_instance, :id, :VALUE, :EXPLAIN
  json.url version_instance_url(version_instance, format: :json)
end
