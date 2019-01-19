class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num < @max && num >= 0
      @store[num] = true
    else 
      raise "Out of bounds"
    end
  end 

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
    
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.length] << num
  end

  def remove(num)
    @store[num % @store.length].delete(num)
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == @store.length
    unless include?(num)
      @store[num % @store.length] << num
      @count += 1 
    end
  end
    
  def remove(num)
    if include?(num)
      @store[num % @store.length].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    oldstore = @store
    @store = Array.new(num_buckets * 2) {Array.new}
    oldstore.each do |bucket|
      bucket.each do |num|
        @store[num % @store.length] << num
      end
    end
  end
end 