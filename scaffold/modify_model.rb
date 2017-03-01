require "FileUtils"
require 'active_support/inflector'

def shell_execute( cmd )
	begin
		system(cmd)
	end
end

Dir.chdir("../web_server/app/models")
class_name = ARGV[0]
key = ARGV[1]

model_name = String.new
class_name.split("_").each do |word|
  model_name += word.capitalize
end

text = File.read(class_name.singularize + ".rb")

from = "class #{model_name} < ActiveRecord::Base"
#puts from

search_statement = '"#{search}"'

to = "class #{model_name} < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where(\"#{key} = ?\", #{search_statement})
    else
      where(\"\\\"#{key}\\\" = ?\", #{search_statement})
    end 
  end"
#puts to
 
text = text.sub(from, to)
#puts text

out_file = File.open(class_name.singularize + ".rb", "w")
out_file.write(text)
