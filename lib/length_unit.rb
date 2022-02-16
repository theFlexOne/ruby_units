require "pry"
require_relative "./unit.rb"

class LengthUnit < Unit
  def initialize(val, sym)
    super(val, sym)
    unless measurement == "length"
      raise TypeError, "Must be a unit of length but was given a unit of #{measurement}"
    end
  end

  def self.calculate_area(a, b)
    if a.class != LengthUnit || b.class != LengthUnit
      raise ArgumentError, "must be of class LengthUnit"
    end
  end
end
