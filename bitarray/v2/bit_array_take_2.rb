# Ruby's Fixnum & Bignum can hold very large integers and automatically handle overflow. I decided to implement BitArray using an integer as storage. Please let me know what you think about code and functionality of a BitArray.
# The problem here counting from left to right

class BitArray
  include Enumerable

  #the first bit is not used
  def initialize size
    @size = size
    @field = 2**size 
  end

  def set *positions
    positions.each do |position|
      raise ArgumentError if position > @size 
      @field |= 2**position
    end
    self
  end

  def unset *positions
    positions.each do |position|
      raise ArgumentError if position > @size 
      @field ^= 2**position 
    end
    self
  end

  def get position
    raise ArgumentError if position > @size 
    (@field >>  position) & 1 
  end

  def each(&block)
    @field.to_s(2)[1..-1].split("").each { |bit_string| yield(bit_string.to_i) }
  end

  def to_s
    @field.to_s(2)[1..-1]
  end

  def count
    inject(0,:+)
  end
  
end



