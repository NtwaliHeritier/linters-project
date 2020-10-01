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

 file=File.open(file_path, "r")
 test=Test.new(file)
 puts test.test_file()
 file.close()

