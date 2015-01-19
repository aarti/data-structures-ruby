require_relative 'bplus_array' 
class Node

  def initialize(bfactor, is_leaf:, is_root:)
    @bpa = BPlusArray.new bfactor
    @is_root = is_root
    @is_leaf = is_leaf
    @bfactor = bfactor
  end

  def insert key, value
    @bpa.insert key, value
  end
  
  def get key
    @bpa.get key
  end  
    

  
end
