json.array!(@gacha_machines) do |gacha_machine|
  json.extract! gacha_machine, :id, :GACHA_MACHINE_ID, :GACHA_MACHINE_TYPE
  json.url gacha_machine_url(gacha_machine, format: :json)
end
