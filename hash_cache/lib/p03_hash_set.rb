class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end
    unless self.include?(key)
      @store[key.hash % @store.length] << key
      @count += 1
    end
  end

  def include?(key)
    @store[key.hash % @store.length].include?(key)
  end

  def remove(key)
    if self.include?(key)
      @store[key.hash % @store.length].delete(key)
      @count -= 1
    end
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
    @store = Array.new(num_buckets*2) {Array.new}
    oldstore.each do |bucket|
      bucket.each do |el|
        @store[el.hash % @store.length] << el 
      end
    end
  end
end
