require "pry"
require_relative "./modules/constants_module.rb"

class Length_Converter
  include Constants
  attr_reader :init_value, :init_unit, :value, :unit

  # UNIT_LIST = Constants.const_get("UNIT_LIST")

  def initialize(value, sym = self.base_unit_symbol)
    value = (Float value).round(4)
    base_value = Length_Converter.convert(value, sym)

    @value = value # value is static
    @unit = sym
    @base_value = base_value # technically, this is unused
    @base_value_history = [base_value] # technically, this is unused
    @init_value = @value # keep track of initial value
    @init_unit = @unit # keep track of initial unit
  end

  # read constants
  def self.unit_list
    UNIT_LIST
  end

  def self.base_unit
    self.unit_list.find do |unit|
      return unit if unit[:multiplier] == 1
    end
  end

  def self.base_unit_symbol
    self.base_unit[:symbol]
  end

  def self.base_unit=(unit)
    throw "base_unit can not be changed, for now..." # base_unit can never be changed, for now...
  end

  # I'm going to remove unused code and only expose the absolutely neccessary code
  #  - unused code -
  def self.multiplier_formula
    puts "Formula = BASE_UNIT_VALUE * base_value"
  end

  def self.display(value, unit)
    "#{value}#{unit}"
  end

  # useful class helper method - could maybe be private or protected
  def self.get_multiplier(sym)
    unit = self::UNIT_LIST.find { |u| u[:symbol] == sym }
    unit[:multiplier]
  end

  # converts measurement (ex: "100cm") into new unit (ex: "1m")
  # omit third parameter to convert to "base"
  def self.convert(old_value, old_unit, new_unit = self.base_unit_symbol)
    old_multiplier = self.get_multiplier(old_unit)
    new_multiplier = self.get_multiplier(new_unit)
    new_value = (old_value * (1.0 / old_multiplier) * new_multiplier).round(4)
    display = self.display(new_value, new_unit)
    [new_value, new_unit, display]
  end

  def self.add_values(val1, unit1, val2, unit2 = nil)
    unit2 = unit2 || unit1
    base_val1 = Length_Converter.convert(val1, unit1)[0]
    base_val2 = Length_Converter.convert(val2, unit2)[0]
    base_sum = base_val1 + base_val2
    converted_sum = Length_Converter.convert(base_sum, self.base_unit_symbol, unit2)[0].round(4)
    display = self.display(converted_sum, unit2)
    [converted_sum, unit2, display]
  end

  # this is the most recent thing I wrote. I'm proud of this b/c I'm adding to instances of this class, effectively using them as if they were primitives.
  def self.add_measurements(meas1, meas2)
    if (meas1.class != Length_Converter || meas2.class != Length_Converter)
      return throw("Invalid arguments. Must pass in two instances of Length_Converter with the same @unit_type")
    end
    new_val = self.add_values(meas1.value, meas1.unit, meas2.value, meas2.unit)
    Length_Converter.new(new_val, meas1.unit)
  end

  def convert_to(sym)
    unit = sym
    value = Length_Converter.convert(@value, @unit, unit)[0]
    Length_Converter.new(value, unit)
  end

  def convert_to!(sym)
    unit = sym
    @value, @unit = Length_Converter.convert(@value, @unit, unit)
    self
  end

  # useful instance helper method
  def multiplier
    Length_Converter.get_multiplier(@unit)
  end

  # setter that sets @unit & changes @value based on new @unit
  def unit=(sym)
    @value = Length_Converter.convert(@value, @unit, sym)[0]
    @unit = sym
    @value
  end

  # get base_value_history - optional param 'unit' to display in different units; set to BASE_UNIT_SYMBOL by default
  def base_value_history(unit = self.base_unit_symbol)
    @base_value_history.map do |value|
      Length_Converter.convert(value, self.base_unit_symbol, unit)[0..1]
    end
  end

  # adds given value to length - return a new Length_Converter instance
  def add_value(value, unit = nil)
    new_value, new_unit = Length_Converter.add_values(@value, @unit, value, unit)
    # base_input_value = Length_Converter.convert(value, unit)[0]
    # old_base_value = Length_Converter.convert(@value, @unit)[0]
    # new_base_value = old_base_value + base_input_value
    # new_unit = use_new_unit ? unit : @unit
    # new_value = Length_Converter.convert(new_base_value, BASE_UNIT_SYMBOL, new_unit)[0]
    Length_Converter.new(new_value, new_unit)
  end

  # adds given value to length - mutates current instance and returns self
  # need to redo with Length_Converter.add_values
  def add_value!(value, unit = self.base_unit_symbol)
    converted_input = Length_Converter.convert(value, unit, @unit)
    new_value = @value + converted_input
    push_to_base_value_history(new_value, @unit)
    @value = new_value
    self
  end

  # subtracts given value from length - return a new Length_Converter instance
  def subtract_value(value, unit, use_new_unit = false)
    base_input_value = Length_Converter.convert(value, unit)
    old_base_value = Length_Converter.convert(@value)
    new_base_value = old_base_value - base_input_value
    new_unit = use_new_unit ? unit : @unit
    new_value = Length_Converter.convert(new_base_value, self.base_unit_symbol, new_unit)
    Length_Converter.new(new_value, new_unit)
  end

  # subtracts given value from length - mutates current instance and returns self
  def subtract_value!(value, unit)
    converted_input = Length_Converter.convert(value, unit, @unit)
    new_value = @value - converted_input
    push_to_base_value_history(new_value, @unit)
    @value = new_value
    self
  end

  def add
  end

  def add!
  end

  def subtract
  end

  def subtract!
  end

  # for display purposes
  def display(base = false)
    return base ? "#{@base_value}m" : "#{@value}#{@unit}"
  end

  def display_base(integer = false)
    to_s(true)
  end

  private

  # unused
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
