require "pry"
require_relative "./unit_list_module.rb"

module BaseUnit
  def self.all_base_units
    UnitList.unit_list.filter do |unit|
      unit[:multiplier] == 1.00
    end
  end

  def self.base_unit_by_measurement(measurement)
    self.all_base_units.find do |unit|
      unit[:measurement] == measurement
    end
  end

  def self.base_unit_by_sym(sym)
    measurement = UnitQuery.sym_measurement(sym)
    self.base_unit_by_measurement(measurement)
  end
end
