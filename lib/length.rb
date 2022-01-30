require "pry"
require_relative "./unit.rb"

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

class Length < Unit
  attr_reader :system
  @@unit_list = []

  def initialize(name, sym, multiplier, system = "undefined")
    super(name, sym, multiplier, self)
    @system = system
    @@unit_list << self
  end

  def self.unit_list
    @@unit_list
  end
end

unit_objects = LENGTH_UNITS.map do |unit|
  Length.new(unit[:name], unit[:symbol], unit[:multiplier], (unit[:system] || "undefined"))
end

binding.pry
