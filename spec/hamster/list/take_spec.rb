require File.expand_path('../../spec_helper', File.dirname(__FILE__))

require 'hamster/list'

describe Hamster::List do

  describe "#take" do

    it "is lazy" do
      lambda { Hamster.stream { fail }.take(1) }.should_not raise_error
    end

    [
      [[], 10, []],
      [["A"], 10, ["A"]],
      [["A"], -1, []],
      [["A", "B", "C"], 0, []],
      [["A", "B", "C"], 2, ["A", "B"]],
    ].each do |values, number, expected|

      describe "#{number} from #{values.inspect}" do

        before do
          @original = Hamster.list(*values)
          @result = @original.take(number)
        end

        it "preserves the original" do
          @original.should == Hamster.list(*values)
        end

        it "returns #{expected.inspect}" do
          @result.should == Hamster.list(*expected)
        end

      end

    end

  end

end
