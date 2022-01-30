require_relative "../lib/length_unit.rb"

describe "Length_Unit" do
  it "requires a 'sym', and a 'multiplier' property to instantiate" do
    unit = Length_Unit.new("m", 1.0)
    sym = unit.instance_variable_get(:@sym)
    multiplier = unit.instance_variable_get(:@multiplier)

    expect(sym).to eq("m")
    expect(multiplier).to eq(1.0)
  end

  it "takes an optional third argument for 'name'" do
    defined_name = Length_Unit.new("m", 1.0, "meter").instance_variable_get(:@name)
    undefined_name = Length_Unit.new("m", 1.0).instance_variable_get(:@name)
    expect(defined_name).to eq("meter")
    expect(undefined_name).to eq("undefined")
  end

  it "inherits from Unit_Stem" do
    unit = Unit_Stem.new("m", 1.0)
    expect(unit).to be_a(Unit_Stem)
  end

  # describe "@system" do
  #   metric = Unit.new({ name: "meter", sym: "m", multiplier: 1.0, system: "metric" }).instance_variable_get(:@system)
  #   other = Unit.new({ name: "meter", sym: "m", multiplier: 1.0, system: nil }).instance_variable_get(:@system)
  #   it "is a string" do
  #     expect(metric).to be_a(String)
  #     expect(other).to be_a(String)
  #   end
  #   it "is set to 'other' if not set explicitly" do
  #     expect(metric).to eq("metric")
  #     expect(other).to eq("other")
  #   end
  # end
end
