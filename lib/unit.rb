require "pry"
require_relative "./modules/base_unit_module.rb"
require_relative "./modules/unit_query_module.rb"
require_relative "./modules/unit_list_module.rb"
require_relative "./modules/unit_math_module.rb"
require_relative "./unit_controller.rb"

class Unit
  module UnitFunctionality
    include UnitMath
    include BaseUnit
    include UnitQuery
    include UnitList
  end

  attr_accessor :val, :sym

  @@custom_units = []

  def initialize(val, sym)
    @val = val.to_f
    @sym = sym
  end

  def self.all_units
    UnitList.unit_list + @@custom_units
  end

  def self.unit_list(measurement = nil)
    UnitList.unit_list(measurement)
  end

  def display
    "#{self.val} #{self.sym}"
  end

  # binding.pry
end

x = Unit.new 1, "mi"
y = Unit.new 500, "m"
z = Unit.new 60, "s"

# binding.pry
