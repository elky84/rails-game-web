require 'find'
require 'json'

require 'active_support/inflector' 
require 'active_support/core_ext/numeric/time' # for time helper
require 'time' # for time

require 'rest_client'

address = "http://127.0.0.1:3000"
#address = ARGV[0]

response = RestClient.get(address.downcase + "/pvp/get_period.json")

puts response.code

puts response.headers

json = JSON.parse(response.to_s)

puts json.to_s

json.each do |period|
  end_date = period["END_DATE"]
  diff = (Time.parse(end_date) - Time.now)
  #diff = (Time.now - 1.hours) - Time.now
  
  puts "minutes: " + diff
  puts "hours: " + (diff / 3600)
  puts "days: " + (diff / 3600 / 24)
  
  if diff < 10.minutes
	  response = RestClient.get(address.downcase + "/pvp/end_of_competition.json")
	  if response.code != 200
		puts "error:" + response.to_s
	  end 	
  end
  
end
