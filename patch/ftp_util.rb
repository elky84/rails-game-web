#encoding: ASCII-8BIT

require 'net/ftp'

def safe_chdir(ftp, path)
	begin
		puts path
		ftp.chdir(path)
	 rescue Exception
		ftp.mkdir(path)
		ftp.chdir(path)
	end
end

def ftp_login(ip, port, id, password)
	#puts ip + " " + port + " " + id + " " + password
	ftp = Net::FTP.new()
	ftp.connect(ip, port)
	ftp.passive = true
	puts ftp.login(id, password)
	return ftp
end