require "pry"
require_relative "./unit_stem.rb"

LENGTH_UNITS = [
  { symbol: "mm", multiplier: 0.001, name: "millimeter", unit_type: "length", system: "metric" },
  { symbol: "cm", multiplier: 0.01, name: "centimeter", unit_type: "length", system: "metric" },
  { symbol: "m", multiplier: 1, name: "meter", unit_type: "length", system: "metric" },
  { symbol: "km", multiplier: 1000, name: "kilometer", unit_type: "length", system: "metric" },
  { symbol: "in", multiplier: 0.0254, name: "inches", unit_type: "length", system: "imperial" },
  { symbol: "ft", multiplier: 0.3048, name: "feet", unit_type: "length", system: "imperial" },
  { symbol: "yd", multiplier: 0.9144, name: "yard", unit_type: "length", system: "imperial" },
  { symbol: "mi", multiplier: 1609.34, name: "miles", unit_type: "length", system: "imperial" },
  { symbol: "au", multiplier: 1.496e+11, name: "astronomical unit", unit_type: "length", system: "other" },
]

class Length_Unit < Unit_Stem
  attr_reader :system, :unit_type
  @@unit_list = []

  def initialize(sym, multiplier, name = "undefined", system = "undefined")
    # binding.pry
    super(sym, multiplier, name, self)
    @unit_type = "length"
    @system = system
    @@unit_list << self
    @@base_unit = self if multiplier == 1.0
  end

  def self.unit_list
    @@unit_list
  end

  def base_unit
    @@base_unit || "undefined"
  end

  def self.base_unit
    @@base_unit
  end
end

length_units = LENGTH_UNITS.map do |unit|
  Length_Unit.new(unit[:symbol], unit[:multiplier], unit[:name], (unit[:system] || "undefined"))
end

binding.pry
