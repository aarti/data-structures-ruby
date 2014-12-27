class BPlusArray
  attr_accessor :bpa

  def initialize bfactor
    @bpa = Array.new ( (bfactor * 2) - 1 ) { nil }
  end
  
  def key idx
    @bpa[idx]
  end
  
  def value idx
    @bpa[bfactor-1+idx]
  end
  
  def sibling_ptr
    @bpa.last
  end
  
  def sibling_ptr= sibling
    @bpa[@bpa.count - 1 ] = sibling
  end
  
end