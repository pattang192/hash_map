# linked_list.rb

# linked list methods
class LinkedList
  attr_accessor :head

  def append(value)
    if @head.nil?
      prepend(value)
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = @head.nil? ? Node.new(value) : Node.new(value, @head)
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

  def contains?(value)
    return false if @head.nil?

    current = @head
    current = current.next_node while current.value[0] != value && !current.next_node.nil?
    return true if current.value[0] == value

    false
  end

  def retrieve(value)
    current = @head
    current = current.next_node while current.value[0] != value && !current.next_node.nil?
    return puts current.value[1] if current.value[0] == value

    false
  end

  def all_keys
    keys = []
    current = @head
    until current.nil?
      keys << current.value[0]
      current = current.next_node
    end
    keys
  end

  def all_values
    values = []
    current = @head
    until current.nil?
      values << current.value[1]
      current = current.next_node
    end
    values
  end

  def all_entries
    entries = []
    current = @head
    until current.nil?
      entries << [current.value[0], current.value[1]]
      current = current.next_node
    end
    entries
  end

  def update(key, value)
    current = @head
    current = current.next_node while current.value[0] != key && !current.next_node.nil?
    current.value[1] = value if current.value[0] == key
  end

  def find(value)
    current = @head
    index = 0
    while current.value[0] != value && !current.next_node.nil?

      current = current.next_node
      index += 1
    end
    return index if current.value[0] == value

    nil
  end

  def to_s
    current = @head
    list = ""
    until current.nil?
      list << "(#{current.value}) -> "
      current = current.next_node
    end
    list << "nil"
  end

  def remove_at(index)
    if index.zero?
      puts @head.value[1]
      @head = @head.next_node
    else
      prev_node = @head
      (index - 1).times { prev_node = prev_node.next_node }
      puts prev_node.next_node.value[1]
      next_node = prev_node.next_node.next_node
      prev_node.next_node = next_node
    end
  end
end

# linked list node creation
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
