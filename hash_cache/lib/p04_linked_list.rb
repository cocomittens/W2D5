include Enumerable
require 'byebug'
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
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @tail.prev == @head && @head.next == @tail
  end

  def get(key)
    self.each do |node| 
      if node.key == key
        return node.val
      end 
    end

  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    if empty?
      @tail.prev = Node.new(key, val)
      @head.next = @tail.prev 
    else
      @tail.prev.next = Node.new(key, val)
      @tail.prev = @tail.prev.next
    end
  end

  def update(key, val)
    self.each do |node| 
      if node.key == key
        node.val = val
      end 
    end
  end

  def remove(key)
   # debugger
    self.each do |node| 
      if node.key == key
        # prev_node = node.prev
        # next_node = node.next
        # prev_node.next = next_node
        # next_node.prev = prev_node
        node.next = nil
        node.prev = nil
      end 
    end
  end

  def each
    node = @head
    until node == last
      node = node.next
      yield node
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
