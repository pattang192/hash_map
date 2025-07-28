# hash_map.rb
require_relative "linked_list"

# hash map methods
class HashMap
  attr_accessor :buckets
  attr_reader :load_factor

  def initialize
    @load_factor = 0.75
    @buckets = Array.new(16)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }
    hash_code
  end

  def set(key, value)
    index = hash(key) % @buckets.length
    raise IndexError if index.negative? || index >= @buckets.length

    @buckets[index] = LinkedList.new if @buckets[index].nil?
    if @buckets[index].contains?(key)
      @buckets[index].update(key, value)
    else
      @buckets[index].append(key, value)
    end
    grow?
  end

  def get(key)
    @buckets.compact.each { |list| list.retrieve(key) }
    nil
  end

  def has?(key)
    @buckets.compact.each { |list| return true if list.contains?(key) }
    false
  end

  def remove(key)
    @buckets.compact.each do |list|
      index = list.find(key)
      list.remove_at(index) unless index.nil?
    end
    nil
  end

  def length
    length = 0
    @buckets.compact.each { |list| length += list.size }
    length
  end

  def clear
    @buckets = Array.new(16)
  end

  def keys
    keys = []
    @buckets.compact.map { |list| keys << list.all_keys }
    keys.flatten
  end

  def values
    values = []
    @buckets.compact.map { |list| values << list.all_values }
    values.flatten
  end

  def entries
    entries = []
    key = keys
    value = values
    key.each_index { |i| entries[i] = [key[i], value[i]] }
    entries
  end

  def grow?
    capacity = @buckets.length
    grow if length > capacity * @load_factor
  end

  def grow
    pairs = entries
    @buckets = Array.new(@buckets.length * 2)
    pairs.map { |pair| set(pair[0], pair[1]) }
  end
end
