# frozen_string_literal: true

require_relative '../lib/file_test.rb'

describe Test do
  let(:test) { Test.new }
  let(:string_line) { "main(){ \n" }
  let(:cout_line) { "cin >> a" }
  describe "#check_trailing" do
    it "returns array with error" do
      expect(test.check_trailing(string_line)).to eql(['There is a trailing space at line 1'])
    end

    it "returns array with error" do
      expect(test.check_trailing(string_line)).to_not eql(['There is a trailing space at line 2'])
    end
  end

  describe "#check_semi_colon" do
    it "returns array with error" do
      expect(test.check_semi_colon(string_line)).to_not eql(['There is a missing semi_colon at line 1'])
    end
  end

  describe "#check_paranthesis" do
    it "returns 1 or -1" do
      expect(test.check_paranthesis(string_line)).to eql(1)
    end
    it "returns 1 or -1" do
      expect(test.check_paranthesis(string_line)).to_not eql(-1)
    end
  end
end
