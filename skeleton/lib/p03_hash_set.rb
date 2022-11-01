class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(input)
    input = input.hash
    if self.include?(input)
      return
    end

    if @count == @store.length
      self.resize!()
    end

    @store[pointer_math(input)] << input
    @count += 1
    
  end

  def include?(input)
    input = input.hash
    @store[pointer_math(input)].each do |ele|
      if ele == input
        return true
      end
    end
    false
  end


  def remove(input)
    input = input.hash
    @store[pointer_math(input)].each.with_index do |ele, i|
      if ele == input
        @store[pointer_math(input)].delete_at(i)
        @count -=1
      end
    end
  end

  def pointer_math(input)

    return input % num_buckets
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
