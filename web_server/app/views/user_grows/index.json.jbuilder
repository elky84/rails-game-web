json.array!(@user_grows) do |user_grow|
  json.extract! user_grow, :id, :GROW_ID, :LEVEL, :REQUIRE_EXP
  json.url user_grow_url(user_grow, format: :json)
end
