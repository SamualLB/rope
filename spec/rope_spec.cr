require "./spec_helper"

describe Rope do
  it "works" do
    true.should eq(true)
  end

  describe "#initialize" do
    it "Can be created from a string" do
      rope = Rope.new("test")
      rope.should be_a(Rope)
      rope.to_s.should eq "test"
    end
  end

  describe "#byte_at" do
    it "can find bytes" do
      rope = Rope.new("123")
      rope.byte_at(0).should eq '1'.ord
      rope.byte_at(1).should eq '2'.ord
      rope.byte_at(2).should eq '3'.ord
    end
  end

  describe "#+" do
    it "can concatinate 2 ropes" do
      rope1 = Rope.new("test ")
      rope2 = Rope.new("string")
      joined = rope1 + rope2
      joined.should be_a(Rope)
      joined.to_s.should eq "test string"
    end

    it "can concatinate with a String" do
      rope = Rope.new("test ")
      str = "string"
      joined = rope + str
      joined.should be_a(Rope)
      joined.to_s.should eq "test string"
    end
  end
end
