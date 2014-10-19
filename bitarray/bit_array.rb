class BitArray
  
  attr_reader :arr
  
  def initialize(size)
    @arr = Array.new(size) {0}
  end
  
  def to_s
    @arr.join()
  end
  
  
end