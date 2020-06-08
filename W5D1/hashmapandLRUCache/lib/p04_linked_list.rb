class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  attr_reader :head, :tail
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if @head.next == @tail
    @head.next
  end

  def last
    return nil if @head.next == @tail
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    return @head.next.val if key == :first
  end

  def include?(key)
  end

  def append(key, val)
    new_penult = Node.new(key, val)
    penult = @tail.prev
    @tail.prev = new_penult
    penult.next = new_penult
  end

  def update(key, val)
    return nil if self.empty?
    if key == :first
      @head.next.val = val
    else
      @last.prev.val = val
    end
  end

  def remove(key)
  end

  require 'byebug'
  def each
    # debugger
    result = []
    start = @head.next
    until start == nil 
      # debugger
      result << start.val
      start = start.next
    end
    # debugger
    result
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
