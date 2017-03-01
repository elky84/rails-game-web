require "FileUtils"

def shell_execute( cmd )
  begin
    system(cmd)
  end
end

Dir.foreach(".") do | file_name |
  if file_name.include?(".bat") & file_name.include?("Validator")
    puts file_name
    shell_execute(file_name)
  end
end