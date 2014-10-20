class BitArray
  include Enumerable

  def initialize size
    @size = size
    @field = 2**size 
  end

  def set positions
    bits = positions.kind_of?(Integer) ? [positions] : positions
    bits.each {  |position| @field |= 1 << (@size - position) } 
    self
  end
  
  def clear positions
    bits = positions.kind_of?(Integer) ? [positions] : positions
    bits.each {  |position| @field ^= 1 << (@size - position) } 
    self
  end  

  def get position
    (@field >> (@size - position) ).to_s(2)[-1].to_i
  end

  def each(&block)
    @field.to_s(2)[1..-1].split("").each { |bit_string| yield(bit_string.to_i) }
  end

  def to_s
    @field.to_s(2)[1..-1]
  end

  def count
    @field.to_s(2)[1..-1].split("").inject(0) {|sum,bit| sum + bit.to_i}
  end
  
end




