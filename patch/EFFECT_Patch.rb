#encoding: ASCII-8BIT

require 'net/ftp'
load 'ftp_util.rb'

ftp = ftp_login(ARGV[1], ARGV[2], ARGV[3], ARGV[4])

user_name = ENV['username']
 
puts ARGV[0]
target = ARGV[0]
build_target = ARGV[5]
pre_path = ARGV[6]
 
dir = "c:\\users\\#{user_name}\\AppData\\LocalLow\\RadicalChamber\\Sunbee\\Effect\\Prefabs\\"

safe_chdir(ftp, "/Patch_#{target}/LIST")
ftp.put("c:\\users\\#{user_name}\\AppData\\LocalLow\\RadicalChamber\\Sunbee\\List\\EFFECT_LIST_#{build_target}.json") 

#ftp.mkdir("/Patch_#{target}/#{build_target}/#{pre_path}")

Dir.foreach(dir) do |file| 
	puts file
	if file.include? ".assetbundle"
		safe_chdir(ftp, "/Patch_#{target}/#{build_target}/Effect/Prefabs")
		ftp.put(dir + file.to_s)
	end
end
	
ftp.close