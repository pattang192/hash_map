# main.rb

require_relative "lib/hash_map"
require "rubocop"

test = HashMap.new
test.set("apple", "red")
test.set("banana", "yellow")
test.set("carrot", "orange")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("frog", "green")
test.set("grape", "purple")
test.set("hat", "black")
test.set("ice cream", "white")
test.set("jacket", "blue")
test.set("kite", "pink")
test.set("lion", "golden")
test.set("moon", "silver")
test.set("jacket", "burgundy")
puts test.buckets.compact
puts test.buckets.length
puts test.length
test.get("lion")
puts test.has?("phone")
puts test.has?("elephant")
test.remove("frog")
puts test.length
p test.keys
p test.values
p test.entries
test.clear
puts test.length
puts test.buckets.length
