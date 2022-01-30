require "pry"
require_relative "./unit_stem.rb"

TIME_UNITS = [
  { symbol: "s", multiplier: 1, name: "second", unit_type: "time", system: "SI" },
]

class Time_Unit < Unit_Stem
  attr_reader :system, :unit_type
  @@unit_list = []

  def initialize(sym, multiplier, name = "undefined", system = "undefined")
    super(sym, multiplier, name, self)
    @unit_type = "time"
    @system = system
    @@unit_list << self
  end

  def self.unit_list
    @@unit_list
  end
end

binding.pry
