require_relative '../lib/file_test.rb'

describe Test do
    let(:test) {Test.new(File.open("./file.js", "r"))}
    describe "#test_file" do
        it "returns array with error" do
            expect(test.test_file).to eql(["There is a trailing space at line 3"])
        end

        it "returns array with error" do
            expect(test.test_file).to_not eql(["There is a trailing space at line 4"])
        end
    end
end