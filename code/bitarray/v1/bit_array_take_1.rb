class BitArray
    
  def initialize size
    @arr = Array.new(size) {0}
  end

  def to_s
    @arr.join
  end
  
  def count
    @arr.reduce(0,:+)
  end  
  
  def set positions
    bits = positions
    bits = [positions] if positions.kind_of? Integer
    bits.each { |bit| @arr[bit-1] = 1 } 
    self
  end

  def clear positions
    bits = positions
    bits = [positions] if positions.kind_of? Integer
    bits.each { |bit| @arr[bit-1] = 0 } 
    self
  end
end