json.array!(@shop_items) do |shop_item|
  json.extract! shop_item, :id, :SHOP_ITEM_ID, :HIDE, :GIFT, :STORE, :ICON, :PRICE_TYPE, :CHARACTER_LEVEL, :PRICE, :SHOP_CATEGORY, :CAPACITY, :ITEM_ID, :GACHA, :BONUS_STRING, :BONUS_ID, :NAME, :EXPLAIN, :START_DATE, :END_DATE, :NSTORE_PID, :PLAY_PID
  json.url shop_item_url(shop_item, format: :json)
end
