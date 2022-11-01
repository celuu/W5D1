class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash

    acc = 0
    self.each.with_index do |ele, i|
      if i % 2 == 0
        acc *= ele
      else
        acc += ele
      end
    end

    self.length ^ acc
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    acc = 0
    self.downcase.each_char.with_index do |ele, i|
      if i % 2 == 0
        acc *= alphabet.index(ele)
      else
        acc += alphabet.index(ele)
      end
    end

    self.length ^ acc
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash

    var = 0
    self.each do |k, v|
      var += k.hash ^ v.hash
    end
    var ^ self.length

  end
end
