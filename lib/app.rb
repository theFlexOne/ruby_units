require "pry"
require_relative "./modules/test_module.rb"
# require "./converter.rb"
include Test

puts Test.const_get("UNIT_LIST")

binding.pry
