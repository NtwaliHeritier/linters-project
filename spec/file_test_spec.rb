# rubocop: disable Metrics/BlockLength
# frozen_string_literal: true

require_relative '../lib/file_test.rb'

describe Test do
  let(:test) { Test.new }
  let(:string_line) { "main(){ \n" }
  let(:cout_line) { 'cin >> a' }
  let(:indent_line) { " if(a>2)\ncout<<arr\n}" }
  let(:empty_line) { "cout<<a; \n if(a==2) {" }
  let(:line_below) { "}\n cout<<b;" }

  describe '#check_trailing' do
    it 'returns array with error' do
      expect(test.check_trailing(string_line)).to eql(['There is a trailing space at line 1'])
    end

    it 'returns array with error' do
      expect(test.check_trailing(string_line)).to_not eql(['There is a trailing space at line 2'])
    end
  end

  describe '#check_semi_colon' do
    it 'returns array with error' do
      expect(test.check_semi_colon(string_line)).to_not eql(['There is a missing semi_colon at line 1'])
    end
  end

  describe '#check_paranthesis' do
    it 'returns 1 or -1' do
      expect(test.check_paranthesis(string_line)).to eql(1)
    end
    it 'returns 1 or -1' do
      expect(test.check_paranthesis(string_line)).to_not eql(-1)
    end
  end

  describe '#check_empty_space' do
    it 'returns an error message' do
      expect(test.check_empty_space(string_line)).to eql(['Add a space before { on line 1'])
    end
  end

  describe '#check_below_line' do
    it 'returns an error message' do
      expect(test.check_below_line(line_below)).to eql(['Add an empty space below line 1'])
    end

    it 'returns an error message' do
      expect(test.check_below_line(line_below)).to_not eql(['Add an empty space below line 2'])
    end
  end

  describe '#check_empty_line' do
    it 'returns an error message' do
      expect(test.check_empty_line(empty_line)).to eql(['Add an empty line before line 2'])
    end

    it 'returns an error message' do
      expect(test.check_empty_line(empty_line)).to_not eql(['Add an empty line before line 1'])
    end
  end

  describe '#check_indentation' do
    it 'returns an array with error message' do
      expect(test.check_indentation(indent_line)).to eql(['Fix indentation at line 2'])
    end

    it 'returns an array with error message' do
      expect(test.check_indentation(indent_line)).to_not eql(['Fix indentation at line 1'])
    end
  end
end

# rubocop: enable Metrics/BlockLength
