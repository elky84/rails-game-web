json.array!(@mastery_resets) do |mastery_reset|
  json.extract! mastery_reset, :id, :MASTERY_RESET_ID, :COST
  json.url mastery_reset_url(mastery_reset, format: :json)
end
