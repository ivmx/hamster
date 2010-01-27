require File.expand_path('../../spec_helper', File.dirname(__FILE__))

require 'hamster/set'

describe Hamster::Set do

  [:empty?, :null?].each do |method|

    describe "##{method}" do

      [
        [[], true],
        [["A"], false],
        [["A", "B", "C"], false],
      ].each do |values, expected|

        describe "on #{values.inspect}" do

          before do
            @set = Hamster.set(*values)
          end

          it "returns #{expected.inspect}" do
            @set.send(method).should == expected
          end

        end

      end

    end

  end

end
