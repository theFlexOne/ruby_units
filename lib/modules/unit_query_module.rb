require "pry"

module UnitQuery
  def self.sym_measurement(sym)
    for unit in UnitList.unit_list
      if unit[:symbol] == sym
        measurement = unit[:measurement]
        break
      end
    end
    measurement
  end

  def base_unit
    BaseUnit.base_unit_by_sym(@sym)
  end

  def measurement
    base_unit[:measurement]
  end
end
