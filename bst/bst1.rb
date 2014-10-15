class Bst
  
  attr_accessor :data, :left, :right
  
  def initialize(data)
    self.data = data
  end
  
  def insert(data)
    if  self.data < data
      if (self.right ) 
        self.right.insert(data)
      else  
        self.right = Bst.new(data)
      end  
    else
      if (self.left ) 
        self.left.insert(data)
      else  
        self.left = Bst.new(data)
      end  
    end      
  end
    
  def each(&blk)
    Bst.traverse_preorder(self,&blk)
  end
  
  def self.traverse_preorder(node, &blk)
    return unless node
    traverse_preorder(node.left,&blk) 
    blk.call(node.data)
    traverse_preorder(node.right,&blk)    
  end  
  
end 
