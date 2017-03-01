#encoding: ASCII-8BIT

require 'net/ftp'
load 'ftp_util.rb'

#puts ARGV

ftp = ftp_login(ARGV[1], ARGV[2], ARGV[3], ARGV[4])

user_name = ENV['username']
 
target = ARGV[0]

dir = "c:\\users\\#{user_name}\\AppData\\LocalLow\\RadicalChamber\\Sunbee\\JSON\\" 

#puts ftp.pwd
#puts ftp.list

safe_chdir(ftp, "/Patch_#{target}/LIST")

ftp.put("c:\\users\\#{user_name}\\AppData\\LocalLow\\RadicalChamber\\Sunbee\\List\\LIST.json") 

Dir.foreach(dir) do |file| 
	puts file
	if file.include? "json"
		safe_chdir(ftp, "/Patch_#{target}/JSON")		
		ftp.put(dir + file.to_s)
	end
end
	
ftp.close