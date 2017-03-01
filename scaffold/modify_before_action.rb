require "FileUtils"
require 'active_support/inflector'

def shell_execute( cmd )
	begin
		system(cmd)
	end
end

Dir.chdir("../web_server/app/controllers")
class_name = ARGV[0]
key = ARGV[1]

model_name = String.new
class_name.split("_").each do |word|
  model_name += word.capitalize
end

text = File.read(class_name.pluralize + "_controller.rb")

from = "before_action :set_#{class_name}, only: [:show, :edit, :update, :destroy]"
#puts from

to = "#{from}\n\tbefore_action :ip_check"
#puts to
 
text = text.sub(from, to)
#puts text

out_file = File.open(class_name.pluralize + "_controller.rb", "w")
out_file.write(text)
