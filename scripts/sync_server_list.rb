require 'find'
require 'json'

require 'active_support/inflector'

require 'rest_client'

#address = "http://127.0.0.1:3000"
address = ARGV[0]

response = RestClient.get(address.downcase + "/server_list/get.json")

puts response.code

puts response.headers

json = JSON.parse(response.to_s)

puts json.to_s

json.each do |src|
  res = RestClient.get(src['ADDRESS'].to_s + "/statistics/cu_last.json")
  res_json = JSON.parse(res.to_s)
  cu = res_json[0]['VALUE']    

  res = RestClient.get(src['ADDRESS'].to_s + "/statistics/ru_last.json")
  res_json = JSON.parse(res.to_s)
  ru = res_json[0]['VALUE']
  
  puts "cu=" + cu.to_s + " ru=" + ru.to_s
  response = RestClient.get(address.downcase + "/server_list/update.json" + "?name=" + src['NAME'] + "&cu=" + cu.to_s + "&ru=" + ru.to_s)
  if response.code != 200
    puts "error:" + response.to_s
  end 
end
