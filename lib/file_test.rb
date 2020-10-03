# rubocop: disable Metrics/MethodLength

class Test
  KEYS = %w[function if for while].freeze
  attr_reader :linter_errors
  def initialize
    @linter_errors = []
    @line_no = 1
    @opening_paranthesis = 0
    @closing_paranthesis = 0
  end

  def check_trailing(file_line)
    file_line = file_line.split("\n")
    file_line.each do |i|
      @linter_errors.push("There is a trailing space at line #{@line_no}") if i.split('')[-1] == ' ' && i.match?(/\w/)
      @line_no += 1
    end
    @line_no = 1
    @linter_errors
  end

  def check_semi_colon(file_line)
    file_line = file_line.split("\n")

    file_line.each do |i|
      if !i.split('').include?(';') && i.match?(/\w/) && @line_no != 1
        @linter_errors.push("There is a missing semi_colon at line #{@line_no}")
      end
      @line_no += 1
    end

    @line_no = 1
    @linter_errors
  end

  def check_paranthesis(file_line)
    file_line = file_line.split("\n")
    file_line.each do |i|
      @opening_paranthesis += 1 if i.split('').include?('{')
      @closing_paranthesis += 1 if i.split('').include?('}')
    end
    @opening_paranthesis <=> @closing_paranthesis
  end

  def check_empty_space(file_line)
    file_line = file_line.split("\n")
    file_line.each do |i|
      if i.include?('{')
        j = i.split('')
        index = j.index('{')
        @linter_errors.push("Add a space before { on line #{@line_no}") unless j[index - 1] == ' '
      end
      @line_no += 1
    end
    @line_no = 1
    @linter_errors
  end

  def check_empty_line(file_line)
    file_line = file_line.split("\n")
    i = 0
    while i < file_line.size
      KEYS.each do |key|
        if file_line[i].include?(key) && file_line[i - 1].match?(/[a-zA-Z0-9]/)
          @linter_errors.push("Add an empty line before line #{@line_no}")
        end
      end
      i += 1
      @line_no += 1
    end
    @line_no = 1
    @linter_errors
  end

  def check_indentation(file_line)
    file_line = file_line.split("\n")
    i = 0
    while i < file_line.size
      KEYS.each do |key|
        next unless file_line[i].include?(key)

        file_word = file_line[i].split('')
        j = i
        temporary = @line_no
        loop do
          j += 1
          temporary += 1
          break if file_line[j].include?('}')

          k = file_line[j].split('')
          @linter_errors.push("Fix indentation at line #{temporary}") unless count(file_word) < count(k)
        end
      end
      i += 1
      @line_no += 1
    end
    @line_no = 1
    @linter_errors
  end

  def count(array)
    increment = 0
    array.each do |i|
      increment += 1 if i.match?(/\s/)
    end
    increment
  end

  def check_below_line(file_line)
    file_line = file_line.split("\n")
    i = 0
    while i < file_line.size
      if file_line[i].include?('}')
        if !file_line[i + 1].nil? && file_line[i + 1].match?(/[a-zA-Z0-9]/) && !file_line[i + 1].include?('}')
          @linter_errors.push("Add an empty space below line #{@line_no}")
        end
      end
      @line_no += 1
      i += 1
    end
    @line_no = 1
    @linter_errors
  end
end

# rubocop: enable Metrics/MethodLength
