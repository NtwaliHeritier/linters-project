# frozen_string_literal: true

class Test
  attr_accessor :file_content, :linter_errors, :opening_paranthesis, :closing_paranthesis
  def initialize
    @file_content = ''
    @linter_errors = []
    @line_no = 0
    @opening_paranthesis=0
    @closing_paranthesis=0
  end

  def check_trailing(file_line, array)
    @line_no += 1
    array.push("There is a trailing space at line #{@line_no}") if file_line.split('')[-2] == ' '
    array
  end

  def check_semi_colon(file_line, array)
    if !file_line.split("").include?(";") &&
       !file_line.split("").include?("{") && !file_line.split("").include?("}")
      array.push("There is a missing semi_colon at line #{@line_no}")
    end
    array
  end

  def check_paranthesis(file_line)
    @opening_paranthesis+=1 if file_line.split("").include?("{")
    @closing_paranthesis+=1 if file_line.split("").include?("}")
  end
end
