# linked_list.rb

# linked list methods
class LinkedList
  attr_accessor :head

  def append(key, value, current = @head)
    if @head.nil?
      prepend(key, value)
    elsif contains?(key)
      update(key, value)
    else
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(key, value)
    end
  end

  def prepend(key, value)
    @head = @head.nil? ? Node.new(key, value) : Node.new(key, value, @head)
  end

  def size
    return 0 if @head.nil?

    size = 1
    current = @head
    until current.next_node.nil?
      current = current.next_node
      size += 1
    end
    size
  end

  def contains?(key)
    return false if @head.nil?

    current = @head
    current = current.next_node while current.key != key && !current.next_node.nil?
    return true if current.key == key

    false
  end

  def retrieve(key, current = @head)
    current = current.next_node while current.key != key && !current.next_node.nil?
    return puts current.value if current.key == key

    false
  end

  def all_keys(current = @head)
    keys = []
    until current.nil?
      keys << current.key
      current = current.next_node
    end
    keys
  end

  def all_values(current = @head)
    values = []
    until current.nil?
      values << current.value
      current = current.next_node
    end
    values
  end

  def all_entries(current = @head)
    entries = []
    until current.nil?
      entries << [current.key, current.value]
      current = current.next_node
    end
    entries
  end

  def update(key, value, current = @head)
    current = current.next_node while current.key != key && !current.next_node.nil?
    current.value = value if current.key == key
  end

  def find(key, current = @head)
    index = 0
    while current.key != key && !current.next_node.nil?
      current = current.next_node
      index += 1
    end
    return index if current.key == key

    nil
  end

  def to_s(current = @head)
    list = ""
    until current.nil?
      list << "(#{current.key}, #{current.value}) -> "
      current = current.next_node
    end
    list << "nil"
  end

  def remove_at(index)
    if index.zero?
      puts @head.value
      @head = @head.next_node
    else
      prev_node = @head
      (index - 1).times { prev_node = prev_node.next_node }
      puts prev_node.next_node.value
      next_node = prev_node.next_node.next_node
      prev_node.next_node = next_node
    end
  end

  # linked list node creation
  class Node
    attr_accessor :key, :value, :next_node

    def initialize(key = nil, value = nil, next_node = nil)
      @key = key
      @value = value
      @next_node = next_node
    end
  end
end
