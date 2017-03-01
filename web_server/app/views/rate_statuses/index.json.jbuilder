json.array!(@rate_statuses) do |rate_status|
  json.extract! rate_status, :id, :RATE_NO, :USER_NO, :POISON_RATE, :SILENCE_RATE, :PARALYZE_RATE, :SLOW_RATE, :RESIST_POISON, :RESIST_SILENCE, :RESIST_PARALYZE, :RESIST_SLOW, :HP_STEAL_HIT, :MP_STEAL_HIT, :HP_STEAL_DAMAGE, :MP_STEAL_DAMAGE, :LAST_DATE
  json.url rate_status_url(rate_status, format: :json)
end
