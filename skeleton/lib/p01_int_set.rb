class MaxIntSet
  attr_reader :limit, :store
  def initialize(max)
    @store = Array.new(max)
    @limit = max

  end

  def insert(num)
    if num >= @limit || num < 0
      raise "Out of bounds"
    end

    @store[num] = true

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
    @store[pointer_math(num)] << num
  end

  def remove(num)
    @store[pointer_math(num)].each.with_index do |ele, i|
      if ele == num
        @store[pointer_math(num)].delete_at(i)
      end
    end
  end

  def include?(num)
    @store[pointer_math(num)].each do |ele|
      if ele == num
        return true
      end
    end
    false
  end

  def pointer_math(num)
    return num % 20
  end

  private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self.include?(num)
      return

    end

    if @count == @store.length
      self.resize!()
    end

    @store[pointer_math(num)] << num
    @count += 1

    
  end

  def remove(num)
    @store[pointer_math(num)].each.with_index do |ele, i|
      if ele == num
        @store[pointer_math(num)].delete_at(i)
        @count -=1
      end
    end
  end

  def include?(num)
    @store[pointer_math(num)].each do |ele|
      if ele == num
        return true
      end
    end
    false
  end


  def pointer_math(num)
    return num % num_buckets
  end


  private


  def num_buckets
    @store.length
  end

  def resize!()
    temp = @store
    @store = Array.new(2*num_buckets){Array.new()}
    @count = 0
    temp.each do |ele|
      ele.each do |ele_2|
        self.insert(ele_2)
      end
    end
  end
end
