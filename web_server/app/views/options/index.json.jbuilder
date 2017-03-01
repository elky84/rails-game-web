json.array!(@options) do |option|
  json.extract! option, :id, :OPTION_ID, :CONDITION_ID, :PARAMETER_ID, :DESCRIPTION, :UI_SCRIPT, :VALUE, :MAX_VALUE, :RANDON_ACTIVITY, :PERCENT
  json.url option_url(option, format: :json)
end
