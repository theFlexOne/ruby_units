require "pry"
require_relative "../lib/length_converter.rb"

describe Length_Converter do
  TEST_LENGTH_1 = Length_Converter.new(1.0, "m")
  TEST_LENGTH_2 = Length_Converter.new(100, "cm")
  TEST_LENGTH_3 = Length_Converter.new("24", "in")

  # FAIL_LENGTH_1 = Length_Converter.new([1.0], "m")
  # FAIL_LENGTH_2 = Length_Converter.new(1.0, [])

  it "takes in a float and a string as arguments to instantiate" do
    expect(TEST_LENGTH_1).to be_a(Length_Converter)
  end
  describe "first instantiation argument" do
    it "it's successfully coerced into a float" do
      expect(TEST_LENGTH_2).to be_a(Length_Converter)
      expect(TEST_LENGTH_3).to be_a(Length_Converter)
    end
    # expect(Length_Converter.new([1.0], "m")).to raise_error(TypeError)
  end
end
