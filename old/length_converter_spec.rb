require_relative "../lib/converter.rb"
require "pry"

# include Constants
# puts Constants.constants

TEST_VALUE_1 = 12
TEST_UNIT_1 = "in"

TEST_CONVERTER_1 = Length_Converter.new(12, "in")

describe "Valid_Length_Converter" do
  it "creates a new class instance with a @value & @unit properties on init" do
    c = TEST_CONVERTER_1
    expect(c.value).to eq(12)
    expect(c.unit).to eq("in")
  end
end

describe "Init_Value_And_Unit" do
  it "sets a @init_value & @init_unit property on init" do
    c = TEST_CONVERTER_1
    expect(c.init_value).to eq(12)
    expect(c.init_unit).to eq("in")
    binding.pry
  end
end

describe "Base_Value_History" do
  it "sets a @base_value & shovels it into @base_value_history as index[0] on init" do
    c = TEST_CONVERTER_1
    expect(c.base_value_history.length).to eq(1)
    expect(c.base_value_history[0]).to eq(0.30479983540808886)
    binding.pry
  end
end

describe "Add_And_Subtract" do
  it "correctly add/subtract this instance value and a value passed as an argument (ex: 12in + 2ft = 36in) and return a new Length_Converter instance of new value" do
    c = TEST_CONVERTER_1
    d = c.add(2, "ft")
    expect(c).not_to be(d)
    expect(d.value).to eq(36)
    expect(d.unit).to eq("in")
  end
end

describe "Add!_And_Subtract!" do
  it "correctly add/subtract this instance value and a value passed as an argument (ex: 12in + 2ft = 36in) mutating this instance and appending a new value to @base_value_history" do
    c = TEST_CONVERTER_1
    c.add!(2, "ft")
    expect(c.value.round).to eq(36)
    expect(c.unit).to eq("in")
  end
end

describe "Convert_Unit_Types" do
  it "takes in a length value & length unit, and a new length unit and converts the old value into the new units" do
    i = Length_Converter.convert(2, "ft", "in").round
    expect(i).to eq(24)
  end
end
