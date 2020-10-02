# frozen_string_literal: true

class Test
  attr_accessor :file_content, :linter_errors, :opening_paranthesis, :closing_paranthesis
  def initialize
    @file_content = ''
    @linter_errors = []
    @line_no = 1
    @opening_paranthesis=0
    @closing_paranthesis=0
  end

  def check_trailing(file_line)
    file_line=file_line.split("\n")
    
    for i in file_line do
      @linter_errors.push("There is a trailing space at line #{@line_no}") if i.split("")[-1] == " " && i.match?(/\w/)
      @line_no += 1
    end

    @line_no=1
    @linter_errors
  end

  def check_semi_colon(file_line)
    file_line=file_line.split("\n")

    for i in file_line
      if !i.split("").include?(";") && i.match?(/\w/)&&@line_no!=1
       @linter_errors.push("There is a missing semi_colon at line #{@line_no}") 
      end
      @line_no += 1
    end

    @line_no=1
    @linter_errors
  end

  def check_paranthesis(file_line)
    file_line=file_line.split("\n")
    for i in file_line
      @opening_paranthesis+=1 if i.split("").include?("{")
      @closing_paranthesis+=1 if i.split("").include?("}")
    end
  end

  def check_empty_space(file_line)
    file_line=file_line.split("\n")
    for i in file_line
      if i.include?("{") 
        j=i.split("")
        index=j.index("{")
        @linter_errors.push("Add a space before { on line #{@line_no}") unless j[index-1]==' '
      end
      @line_no+=1
    end
    @line_no=1
  end

  def check_empty_line(file_line)
    file_line=file_line.split("\n")
    i=0
    while i<file_line.size do
      if file_line[i-1].match?(/[a-zA-Z0-9]/)&&(file_line[i].include?("if") || file_line[i].include?("for") || file_line[i].include?("function"))
      @linter_errors.push("Add an empty line before line #{@line_no}")
      end
      i+=1
      @line_no+=1
    end
  end
end
