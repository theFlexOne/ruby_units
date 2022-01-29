require "pry"
require_relative "./modules/constants_module.rb"

class Length_Converter
  include Constants
  attr_reader :init_value, :init_unit, :value, :unit

  UNIT_LIST = Constants.const_get("UNIT_LIST")

  BASE_UNIT_SYMBOL = "m"
  BASE_UNIT_VALUE = 1

  def initialize(value, sym = BASE_UNIT_SYMBOL)
    value = (Float value).round(4)
    base_value = Length_Converter.convert(value, sym)

    @value = value # value is static
    @unit = sym
    @base_value = base_value
    @base_value_history = [base_value]
    @init_value = @value # keep track of initial value
    @init_unit = @unit # keep track of initial unit
  end

  # read constants
  def self.unit_list
    UNIT_LIST
  end

  def self.base_unit
    BASE_UNIT_SYMBOL
  end

  def self.base_unit=(unit)
    throw "base_unit can not be changed, for now..." # base_unit can never be changed, for now...
  end

  def self.multiplier_formula
    puts "Formula = BASE_UNIT_VALUE * base_value"
  end

  # useful class helper method
  def self.get_multiplier(sym)
    unit = self::UNIT_LIST.find { |u| u[:symbol] == sym }
    unit[:multiplier]
  end

  # converts measurement (ex: "100cm") into new unit (ex: "1m")
  def self.convert(old_value, old_unit, new_unit = BASE_UNIT_SYMBOL)
    old_multiplier = self.get_multiplier(old_unit)
    new_multiplier = self.get_multiplier(new_unit)
    # binding.pry
    new_value = (old_value * (1.0 / old_multiplier) * new_multiplier)
  end

  def self.add_values(val1, unit1, val2, unit2 = nil, use_unit2 = false)
    unit2 = unit2 || unit1
    base_val1 = Length_Converter.convert(val1, unit1)
    base_val2 = Length_Converter.convert(val2, unit2)
    base_sum = base_val1 + base_val2
    converted_sum = Length_Converter.convert(base_sum, BASE_UNIT_SYMBOL, (use_unit2 ? unit2 : unit1)).round(4)
  end

  def convert(unit)
    @value = Length_Converter.convert(@value, @unit, unit)
    @unit = unit
  end

  # useful instance helper method
  def multiplier
    Length_Converter.get_multiplier(@unit)
  end

  # setter that sets @unit & sets @value based on new @unit
  def unit=(sym)
    @value = Length_Converter.convert(@value, @unit, sym)
    @unit = sym
    @value
  end

  # get base_value_history - optional param 'unit' to display in different units; set to BASE_UNIT_SYMBOL by default
  def base_value_history(unit = BASE_UNIT_SYMBOL)
    @base_value_history.map do |value|
      Length_Converter.convert(value, BASE_UNIT_SYMBOL, unit)
    end
  end

  # adds length - return a new Length_Converter instance
  def add(value, unit, use_new_unit = false)
    base_input_value = Length_Converter.convert(value, unit)
    old_base_value = Length_Converter.convert(@value, @unit)
    new_base_value = old_base_value + base_input_value
    new_unit = use_new_unit ? unit : @unit
    new_value = Length_Converter.convert(new_base_value, BASE_UNIT_SYMBOL, new_unit)
    Length_Converter.new(new_value, new_unit)
  end

  # adds length - mutates current instance
  def add!(value, unit = BASE_UNIT_SYMBOL)
    converted_input = Length_Converter.convert(value, unit, @unit)
    new_value = @value + converted_input
    push_to_base_value_history(new_value, @unit)
    @value = new_value
  end

  # subtracts length - return a new Length_Converter instance
  def subtract(value, unit, use_new_unit = false)
    base_input_value = Length_Converter.convert(value, unit)
    old_base_value = Length_Converter.convert(@value)
    new_base_value = old_base_value - base_input_value
    new_unit = use_new_unit ? unit : @unit
    new_value = Length_Converter.convert(new_base_value, BASE_UNIT_SYMBOL, new_unit)
    Length_Converter.new(new_value, new_unit)
  end

  # subtracts length - mutates current instance
  def subtract!(value, unit)
    converted_input = Length_Converter.convert(value, unit, @unit)
    new_value = @value - converted_input
    push_to_base_value_history(new_value, @unit)
    @value = new_value
  end

  # for display purposes
  def to_s(base = false)
    return base ? "#{@base_value}m" : "#{@value}#{@unit}"
  end

  def to_base_s(integer = false)
    to_s(true)
  end

  private

  def set_measurment_value=(value, unit)
    @value = value
    @base_value = Length_Converter.convert(value, unit)
    @base_value_history << @base_value
    binding.pry
  end

  # appends every *new* instance base_value
  def push_to_base_value_history(value, unit)
    base_value = Length_Converter.convert(value, unit)
    @base_value_history << base_value
  end
end

binding.pry
