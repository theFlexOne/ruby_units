require "pry"

# TEST_UNIT_OPTIONS = {
#   name: "meter",
#   sym: "m",
#   multiplier: 1.0,
#   system: "metric",
# }

class Unit
  attr_reader :unit

  def initialize(name, sym, multiplier)
    multiplier = multiplier.to_f # throw error if multiplier.class is not a "float"
    # system = options[:system] || "other"

    @name = name
    @sym = sym
    @multiplier = multiplier
    # @system = system
  end
end

binding.pry
