class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |num, i|
      sum += (num.hash + i).hash
    end
    sum
  end
end

class String
  def hash
    our_arr = self.chars
    our_arr.map!{|char| char.ord}
    our_arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.values.sort.join.hash
  end
end
