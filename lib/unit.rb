class Unit
  attr_reader :name, :sym, :multiplier

  @@master_units_list = []

  def initialize(name, sym, multiplier, unit = nil)
    multiplier = multiplier.to_f # throw error if multiplier.class is not a "float"

    @name = name
    @sym = sym
    @multiplier = multiplier
    @@master_units_list << unit
  end

  def self.get_master_units_list
    @@master_units_list
  end
end
