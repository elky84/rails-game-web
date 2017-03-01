#encoding: ASCII-8BIT

require 'net/ftp'
load 'ftp_util.rb'

ftp = ftp_login(ARGV[1], ARGV[2], ARGV[3], ARGV[4])

user_name = ENV['username']
 
puts ARGV[0]
target = ARGV[0]
build_target = ARGV[5]

#리스트 파일 업로드
dir = "c:\\users\\#{user_name}\\AppData\\LocalLow\\RadicalChamber\\Sunbee\\SPINE\\" 
#dir = "/User/radicham/Library/Application Support/RadicalChamber/Sunbee/" 

safe_chdir(ftp, "/Patch_#{target}/LIST")
ftp.put("c:\\users\\#{user_name}\\AppData\\LocalLow\\RadicalChamber\\Sunbee\\List\\SPINE_LIST_#{build_target}.json") 
#ftp.put("/User/radicham/Library/Application Support/RadicalChamber/Sunbee/SPINE_LIST_#{build_target}.json") 

Dir.foreach(dir) do |file| 
	if file.include? "assetbundle"
		if file.include? ".meta"
			next
		end
		puts file	
		
		safe_chdir(ftp, "/Patch_#{target}/#{build_target}/Spine")
		ftp.put(dir + file.to_s)
	end
end
	
ftp.close