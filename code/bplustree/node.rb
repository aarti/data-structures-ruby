require_relative 'bplus_array' 
class Node
  attr_reader :is_leaf, :is_root

  def initialize(bfactor, is_leaf:, is_root:)
    @bpa = BPlusArray.new bfactor
    @is_root = is_root
    @is_leaf = is_leaf
    @bfactor = bfactor
  end

  def insert key, value
    if @bpa.full?
      return split
    else  
      @bpa.insert key, value 
      return nil
    end
  end
  
  def get key
    @bpa.get key
  end  
  
  def split 
    middle_key = get_middle_key_position
    right_node = create_right_node middle_key
    remove_right_node_key_values
    @bpa.sibling_ptr = right_node
    @is_leaf=true
    @is_root=false
    
    ParentNode.new @bfactor, middle_key, self, right_node, is_root: true
  end  
end

class ParentNode < Node
  def initialize(@bfactor, middle_key, left_node, right_node, is_root: )
    super @bfactor, is_leaf: false, is_root
    @bpa.i
  end
  
  
end