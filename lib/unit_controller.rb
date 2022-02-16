require "pry"
require "json"

class UnitController
  attr_accessor :unit

  def initialize(unit)
    @unit = { unit: unit }
  end

  def save_to(path = "../config.json")
    File.open(path, "a") do |file|
      file.puts @unit.to_h.to_json
    end
  end

  private

  def append_to_file(file)
    File.open
  end
end

# binding.pry
