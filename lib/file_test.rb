require_relative './file_check.rb'

class Test
    include Check
    attr_accessor :file_content, :linter_errors
    def initialize(file_content)
      @file_content = file_content
      @linter_errors=[]
    end

    def test_file
        check(@file_content, @linter_errors)
    end
end