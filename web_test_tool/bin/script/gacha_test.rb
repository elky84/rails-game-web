require 'find'
require 'json'

require 'active_support/inflector' 
require 'time' # for time
require 'thread'

require 'rest_client'

address = ARGV[0]
if address == nil
  address = "http://127.0.0.1:3000/"
end

seq = ARGV[1]
if seq == nil
  seq = 10
end

loop_count = ARGV[2]
if loop_count == nil
  loop_count = 100
end
loop_count = loop_count.to_i

response = RestClient.get(address.downcase + "user/sign_up.json" + "?user_id=" + seq.to_s + "&nickname=" + seq.to_s + "&device_id=" + seq.to_s)
if response.code != 200
  puts "error:" + response.to_s
end   

json = JSON.parse(response.to_s)
#puts json.to_s

user = nil
character = nil

json.each do |js|
  data = js[1]
  #puts data.to_s
  if data["RESULT_TYPE"] == "USER"
    user = data["RESULT_VALUE"].to_hash
    puts "USER: " + user.to_s
  elsif data["RESULT_TYPE"] == "CHARACTER"
    character = data["RESULT_VALUE"][0]
    #puts "CHARACTER: " + character.to_s
  end
end

for x in 1..loop_count
  puts "user :" + user["USER_NO"].to_s + " try_count:" + x.to_s
  response = RestClient.get(address.downcase + "shop/buy.json" + "?user_no=" + user["USER_NO"].to_s + "&auth_key=" + user["AUTH_KEY"] + "&character_no=" + character["CHARACTER_NO"].to_s + "&shop_item_id=26")
  if response.code != 200
   puts "error:" + response.to_s
  end
  
  response = RestClient.get(address.downcase + "shop/buy.json" + "?user_no=" + user["USER_NO"].to_s + "&auth_key=" + user["AUTH_KEY"] + "&character_no=" + character["CHARACTER_NO"].to_s + "&shop_item_id=37")
  if response.code != 200
   puts "error:" + response.to_s
  end    
end

puts "gacha_test completed."
