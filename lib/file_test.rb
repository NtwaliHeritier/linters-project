require_relative './file_check.rb'

class Test
    include Check
    attr_accessor :file_content, :linter_errors
    def initialize
      @file_content = ""
      @linter_errors=[]
      @line_no=0
    end

    def check_trailing(file_line, array)
        @line_no += 1
        if file_line.split("")[-2]==' '
           array.push("There is a trailing space at line #{@line_no}") 
        end
        array
    end

    def check_semi_colon(file_line, array)
        if file_line.split("")[-2]!=";" && !file_line.split("").include?("{")
           array.push("There is a missing semi_colon at line #{@line_no}") 
        end
        array
    end
end