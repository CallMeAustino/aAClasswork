class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # flattened = self.flatten
    # flattened.each do |ele|
    #   if 
  end
end

class String
  def hash
    sum = 0 
    # alph = ("a".."z").to_a
    self.each_char.with_index do |char, i|
      sum += self.index(char).hash
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
