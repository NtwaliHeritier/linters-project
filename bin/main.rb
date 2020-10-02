# frozen_string_literal: true

require_relative '../lib/file_test.rb'

file_path = ''
puts 'Welcome to the linter'
loop do
  puts 'Please enter the path to your file'
  file_path = gets.chomp
  break if File.exist?(file_path) && file_path.include?('.cpp')

  if File.exist?(file_path)
    puts 'wrong file'
  else
    puts "File doesn't exist"
  end
end

test = Test.new
file_content = test.file_content
linter_array = test.linter_errors
file = File.open(file_path, 'r')
for file_line in file do
  test.check_trailing(file_line, linter_array)
  test.check_semi_colon(file_line, linter_array)
  test.check_paranthesis(file_line)
end
file.close
case test.opening_paranthesis<=>test.closing_paranthesis
 when 1
    test.linter_errors.push("Missing a closing }")
 when -1
    test.linter_errors.push("Unexpected }")
end
puts test.linter_errors
