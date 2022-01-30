require "pry"
require_relative "./unit_stem.rb"
require_relative "./modules/measurement_math.rb"
require_relative "./modules/measurement_conversions.rb"

class Measurement
  # include Unit_Math
  # include Unit_Conversion

  attr_reader :init_value, :init_unit, :value, :unit, :unit_type

  def initialize(val, unit, unit_type = nil)
    master = Unit_Stem.get_master_units_list

    @val = val
    @unit = unit
    @unit_type = unit_type
    @unit_list = []

    binding.pry
  end
end

Measurement.new(1, "m", "length")
