require_relative '../lib/file_test.rb'

describe Test do
    let(:test) {Test.new}
    let(:string_line) {"main(){ \n"}
    let(:empty_array) {[]}
    let(:cout_line) {"cout << \"The value is 2\""}
    describe "#check_trailing" do
        it "returns array with error" do
            expect(test.check_trailing(string_line, empty_array)).to eql(["There is a trailing space at line 1"])
        end

        it "returns array with error" do
            expect(test.check_trailing(string_line, empty_array)).to_not eql(["There is a trailing space at line 2"])
        end
    end

    describe "#check_semi_colon" do
        it "returns array with error" do
            expect(test.check_semi_colon(cout_line, empty_array)).to eql(["There is a missing semi_colon at line 0"])
        end

        it "returns array with error" do
            expect(test.check_semi_colon(string_line, empty_array)).to_not eql(["There is a missing semi_colon at line 1"])
        end
    end
end