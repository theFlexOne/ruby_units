require_relative "../lib/time_unit.rb"

describe "Time_Unit" do
  it "requires a 'sym', and a 'multiplier' property to instantiate" do
    unit = Time_Unit.new("s", 1.0)
    sym = unit.instance_variable_get(:@sym)
    multiplier = unit.instance_variable_get(:@multiplier)

    expect(sym).to eq("s")
    expect(multiplier).to eq(1.0)
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
