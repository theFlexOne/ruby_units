require_relative "../lib/length.rb"

describe "Length" do
  it "should be instantiated with 'name', 'sym', & 'multiplier' arguments" do
    unit = Length.new("meter", "m", 1.0)
    expect(unit.instance_variables).to include(:@name, :@sym, :@multiplier)
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
