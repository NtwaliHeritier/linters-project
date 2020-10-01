file_path = ""
puts "Welcome to the linter"
 loop do
    puts  "Please enter the path to your file"
    file_path = gets.chomp
    break if File.exists?(file_path) 
    puts "File doesn't exist"
 end

puts File.read(file_path)

