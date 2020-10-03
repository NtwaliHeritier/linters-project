# frozen_string_literal: true

class Test
  @@key=%w[function if for while]
  attr_accessor :linter_errors, :opening_paranthesis, :closing_paranthesis
  def initialize
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
    @opening_paranthesis<=>@closing_paranthesis
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
    @linter_errors
  end

  def check_empty_line(file_line)
    file_line=file_line.split("\n")
    i=0
    while i<file_line.size do
       for key in @@key
         if file_line[i].include?(key) && file_line[i-1].match?(/[a-zA-Z0-9]/)
      @linter_errors.push("Add an empty line before line #{@line_no}")
         end
      end
      i+=1
      @line_no+=1
    end
    @line_no=1
    @linter_errors
  end

  def check_below_line(file_line)
    file_line=file_line.split("\n")
    i=0
    while i<file_line.size
      if file_line[i].include?("}")
        if !file_line[i+1].nil? && file_line[i+1].match?(/[a-zA-Z0-9]/) && !file_line[i+1].include?("}")
          @linter_errors.push("Add an empty space below line #{@line_no}")
        end
      end
      @line_no+=1
      i+=1
    end
    @line_no=1
    @linter_errors
  end

  def check_indentation(file_line)
    file_line=file_line.split("\n")
    i=0
    while i<file_line.size
      for key in @@key
        if file_line[i].include?(key)
          file_word=file_line[i].split("")
          j=i
          temporary=@line_no
          loop do
            j+=1
            temporary+=1
            break if file_line[j].include?("}")
            k=file_line[j].split("")
            unless count(file_word) < count(k)
              @linter_errors.push("Fix indentation at line #{temporary}")
            end
          end
        end
      end
      i+=1
      @line_no+=1
    end
    @line_no=1
    @linter_errors
  end

  private def count(array)
    increment=0
    for i in array
      increment+=1 if i.match?(/\s/)
    end
    increment
  end
end
