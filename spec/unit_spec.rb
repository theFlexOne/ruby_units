require_relative "../lib/unit.rb"

describe "Unit" do
  it "should be instantiated with 'name', 'sym', & 'multiplier' arguments" do
    unit = Unit.new("meter", "m", 1.0)
    expect(unit.instance_variables).to include(:@name, :@sym, :@multiplier)
  end

  describe "@multiplier" do
    float = Unit.new("meter", "m", 1.0).instance_variable_get(:@multiplier)
    integer = Unit.new("meter", "m", 1).instance_variable_get(:@multiplier)
    string = Unit.new("meter", "m", "1").instance_variable_get(:@multiplier)
    # fail = Unit.new({ name: "meter", sym: "m", multiplier: [1.0], system: "metric" })
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
    name = Unit.new("meter", "m", 1.0).instance_variable_get(:@name)
    it "is a string" do
      expect(name).to be_a(String)
    end
  end

  describe "@sym" do
    sym = Unit.new("meter", "m", 1.0).instance_variable_get(:@sym)
    it "is a string" do
      expect(sym).to be_a(String)
    end
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
