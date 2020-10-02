require_relative '../lib/file_test.rb'

file_path = ""
puts "Welcome to the linter"
 loop do
    puts  "Please enter the path to your file"
    file_path = gets.chomp
    if File.exists?(file_path)&&file_path.include?(".js")
        break
    elsif File.exists?(file_path)
        puts "wrong file"
    else
        puts "File doesn't exist"
    end
 end

 test=Test.new
 file_content=test.file_content
 linter_array=test.linter_errors
 file=File.open(file_path, "r")
    for file_line in file
    file_content=file_line
    test.check_trailing(file_content, linter_array)
    test.check_semi_colon(file_content, linter_array)
 end
 file.close()

 puts test.linter_errors

