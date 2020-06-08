class MaxIntSet
attr_accessor :store
  def initialize(max) # 2 50, 51 <--- 
    @store = Array.new(max+1, false) #3 [0,1,2]
  end

  # def insert(num) #-1 
  #   raise 'Out of bounds' if num >= @store.length && num >= 0 #num > @store.length+1 #!(0..@store.length).include?(num)
  #   @store[num] = true
  # end

  def insert(num)
    raise 'Out of bounds' if !(0...@store.length).include?(num)
    @store[num] = true
  end



  def remove(num)
     @store.delete_if {|ele| ele == @store[num] }
  end

  def include?(num)
     @store[num] == true
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
    bucket = num % 20
    @store[bucket] << num
  end

  def remove(num)
    bucket = num % 20
    @store[bucket].delete_if {|ele| ele == num}
  end

  def include?(num)
    bucket = num % 20
    @store[bucket].include?(num)
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
  attr_accessor :count
  attr_accessor :store

  def initialize(num_buckets = 20) # 20
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    bucket = num % num_buckets
    if !@store[bucket].include?(num)
      @store[bucket] << num 
      @count += 1
    end
    
    resize! if @count == num_buckets
  end

  def remove(num)
    if self.include?(num)
      bucket = num % num_buckets
      @store[bucket].delete_if {|ele| ele == num}
      @count -= 1
    end
  end

  def include?(num)
    bucket = num % num_buckets
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      @count.times do
        @store << []
      end
      
    big_bucket = []
    @store.each do |bucket|
      bucket.each do |item|
        big_bucket << item
      end
    end
    big_bucket.each do |item|
      x = item % num_buckets # x is what bucket the itme goes into
      @store[x] << item if !@store[x].include?(item)
    end
  end
end
