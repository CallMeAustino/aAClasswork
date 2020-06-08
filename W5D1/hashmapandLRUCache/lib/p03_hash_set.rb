class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    bucket = key.hash % num_buckets
    if !@store[bucket].include?(key)
      @store[bucket] << key 
      @count += 1
    end
    resize! if @count == num_buckets
  end

  def include?(key)
    bucket = key.hash % num_buckets
    @store[bucket].include?(key)
  end

  def remove(key)
    if self.include?(key)
      bucket = key.hash % num_buckets
      @store[bucket].delete_if {|ele| ele == key}
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
