json.array!(@daychecks) do |daycheck|
  json.extract! daycheck, :id, :DAYCHECK_ID, :USER_TYPE, :DAY, :REWARD, :UI_LABEL, :ICON
  json.url daycheck_url(daycheck, format: :json)
end
