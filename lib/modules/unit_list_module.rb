require "pry"

module UnitList
  # make a YAML
  UNIT_LIST = [
    { symbol: "mm", multiplier: 1000.00, name: "millimeter", measurement: "length", system: ["metric", "SI"] },
    { symbol: "cm", multiplier: 100.00, name: "centimeter", measurement: "length", system: ["metric", "SI"] },
    { symbol: "m", multiplier: 1.00, name: "meter", measurement: "length", system: ["metric", "SI"] },
    { symbol: "km", multiplier: 0.001, name: "kilometer", measurement: "length", system: ["metric", "SI"] },
    { symbol: "in", multiplier: 39.3701, name: "inches", measurement: "length", system: ["imperial", "standard"] },
    { symbol: "ft", multiplier: 3.28084, name: "feet", measurement: "length", system: ["imperial", "standard"] },
    { symbol: "yd", multiplier: 1.09361, name: "yard", measurement: "length", system: ["imperial", "standard"] },
    { symbol: "mi", multiplier: 0.000621371, name: "miles", measurement: "length", system: ["imperial", "standard"] },
    { symbol: "au", multiplier: 6.68459e-12, name: "astronomical unit", measurement: "length", system: ["astronomical", "SI"] },
    { symbol: "s", multiplier: 1.00, name: "second", measurement: "time", system: ["SI"] },
    { symbol: "min", multiplier: 0.01667, name: "second", measurement: "time", system: ["SI"] },
  ]

  def self.add_unit(unit)
    @@custom_units << unit
  end

  def self.unit_list(measurement = nil)
    measurement.nil? ? (list = UNIT_LIST) : (list = self.filter_all_by_measurement(measurement))
    #   list = UNIT_LIST
    # else
    #   list = self.filter_all_by_measurement(measurement)
    # end
    list
  end

  def self.filter_all_by_measurement(measurement)
    UnitList.unit_list.filter do |unit|
      unit[:measurement] == measurement.to_s
    end
  end
end

# binding.pry
