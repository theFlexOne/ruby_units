module Constants
  UNIT_LIST = [
    { symbol: "mm", multiplier: 1000, name: "millimeter", measurement: "length", system: "metric" },
    { symbol: "cm", multiplier: 100, name: "centimeter", measurement: "length", system: "metric" },
    { symbol: "m", multiplier: 1, name: "meter", measurement: "length", system: "metric" },
    { symbol: "km", multiplier: 0.001, name: "kilometer", measurement: "length", system: "metric" },
    { symbol: "in", multiplier: 39.3701, name: "inches", measurement: "length", system: "imperial" },
    { symbol: "ft", multiplier: 3.28084, name: "feet", measurement: "length", system: "imperial" },
    { symbol: "yd", multiplier: 1.09361, name: "yard", measurement: "length", system: "imperial" },
    { symbol: "mi", multiplier: 0.000621371, name: "miles", measurement: "length", system: "imperial" },
    { symbol: "au", multiplier: 6.68459e-12, name: "astronomical unit", measurement: "length", system: nil },
  ]

  BASE_UNIT_SYMBOL = "m"
  BASE_UNIT_VALUE = 1
end
