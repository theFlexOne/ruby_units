require "pry"
require_relative "../lib/unit_stem.rb"

describe "Unit_Stem" do
  unit = Unit_Stem.new("m", 1.0)
  sym = unit.instance_variable_get(:@sym)
  multiplier = unit.instance_variable_get(:@multiplier)
  it "requires a 'sym', and a 'multiplier' property to instantiate" do
    expect(sym).to eq(sym)
    expect(multiplier).to eq(multiplier)
  end

  describe "@sym" do
    sym = Unit_Stem.new("m", 1.0).instance_variable_get(:@sym)
    it "is a string" do
      expect(sym).to be_a(String)
    end
  end

  describe "@multiplier" do
    float = Unit_Stem.new("m", 1.0).instance_variable_get(:@multiplier)
    integer = Unit_Stem.new("m", 1).instance_variable_get(:@multiplier)
    string = Unit_Stem.new("m", "1").instance_variable_get(:@multiplier)
    # fail = Unit.new({ name: "meter", sym: "m", multiplier: [1.0], system: "metric" }) # uncomment and test to fail
    it "is correct" do
      expect(float).to be_a(Float).and eq(1.0)
      expect(integer).to be_a(Float).and eq(1.0)
      expect(string).to be_a(Float).and eq(1.0)
    end
    # TESTING FOR TYPE_ERROR
    # it "throws an error if Multiplier.to_f fails" do
    #   expect(STR.instance_variable_get(:@multiplier)).to raise_error
    # end
  end

  describe "@name" do
    defined_name = Unit_Stem.new("m", 1.0, "meter").instance_variable_get(:@name)
    undefined_name = Unit_Stem.new("m", 1.0).instance_variable_get(:@name)
    it "is an optional argument" do
      expect(defined_name).to eq("meter")
      expect(undefined_name).to eq("undefined")
    end
    it "is a string" do
      expect(defined_name).to be_a(String)
      expect(undefined_name).to be_a(String)
    end
  end
end
