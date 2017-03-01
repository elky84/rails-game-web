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

from = "@#{class_name.pluralize} = #{model_name}.all"
#puts from

to = "if params[:search]
      @#{class_name.pluralize} = #{model_name}.search(params[:search])
    else
      @#{class_name.pluralize} = #{model_name}.limit(100)
    end"
#puts to
 
text = text.sub(from, to)
#puts text

out_file = File.open(class_name.pluralize + "_controller.rb", "w")
out_file.write(text)
