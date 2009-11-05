require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Hamster::Hash do

  before do
    @hash = Hamster::Hash.new
  end

  describe "#dup" do

    it "returns self" do
      @hash.dup.should equal(@hash)
    end

  end

  describe "#clone" do

    it "returns self" do
      @hash.clone.should equal(@hash)
    end

  end

end
