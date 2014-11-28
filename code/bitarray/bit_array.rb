# Refactored to reverse the bits, so counting from right to left
# This is a dynamic bit array
class BitArray
  include Enumerable

  def initialize
    @bits = 0
  end

  def set *positions
    positions.each { |position| @bits |= 2**position } 
    self
  end

  def unset *positions
    positions.each { |position| @bits ^= 2**position } 
    self
  end  

  def get position
    (@bits >> position) & 1
  end

  def each(&block)
    bits = @bits
    until bits == 0
      yield bits & 1
      bits = bits >> 1
    end
  end

  def to_s
    @bits.to_s(2).reverse
  end

  def count
    inject(0, :+)
  end
end