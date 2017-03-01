json.array!(@daycheck_scripts) do |daycheck_script|
  json.extract! daycheck_script, :id, :DAYCHECK_ID, :USER_TYPE, :DAY, :REWARD, :UI_LABEL, :ICON
  json.url daycheck_script_url(daycheck_script, format: :json)
end
