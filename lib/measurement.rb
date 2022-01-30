class measurement
  attr_reader :value

  def initialize(value)
    @value = value
  end
end


# UNITS_LIST = [
#   { symbol: "mm", multiplier: 1000, name: "millimeter", unit_type: "length", system: "metric" },
#   { symbol: "cm", multiplier: 100, name: "centimeter", unit_type: "length", system: "metric" },
#   { symbol: "m", multiplier: 1, name: "meter", unit_type: "length", system: "metric" },
#   { symbol: "km", multiplier: 0.001, name: "kilometer", unit_type: "length", system: "metric" },
#   { symbol: "in", multiplier: 39.3701, name: "inches", unit_type: "length", system: "imperial" },
#   { symbol: "ft", multiplier: 3.28084, name: "feet", unit_type: "length", system: "imperial" },
#   { symbol: "yd", multiplier: 1.09361, name: "yard", unit_type: "length", system: "imperial" },
#   { symbol: "mi", multiplier: 0.000621371, name: "miles", unit_type: "length", system: "imperial" },
#   { symbol: "au", multiplier: 6.68459e-12, name: "astronomical unit", unit_type: "length", system: nil },
# # au
# # ly
# ]
