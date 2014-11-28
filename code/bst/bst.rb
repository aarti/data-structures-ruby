class Bst
  
  attr_accessor :data, :left, :right
  
  def initialize(data)
    self.data = data
  end
  
  def insert_r(data)
    if (self.right ) 
      self.right.insert(data)
    else  
      self.right = Bst.new(data)
    end  
  end 
  
  def insert_l(data)
    if (self.left ) 
      self.left.insert(data)
    else  
      self.left = Bst.new(data)
    end  
  end   
  
  def insert(data)
    if  self.data < data
      return insert_r(data)
    elsif self.data > data
      return insert_l(data)
    else ## equal choose left then choose right
      if (self.right )
        return insert_l(data)
      elsif (self.left )
        return insert_r(data)
      end 
    end         
    insert_l(data)     
  end
    
  def each(&blk)
    Bst.traverse(self,&blk)
  end  
  
  def self.traverse(node, &blk)
    return unless node
    traverse(node.left,&blk) 
    blk.call(node)
    traverse(node.right,&blk)    
  end 
  
  def count_unival
    return 0 unless self.data
    return 1 unless self.right && self.left
    c = 0 
    c = 1 if self.left && self.right && self.left.data == self.right.data 
    c = c + self.left.count_unival if self.left
    c = c + self.right.count_unival if self.right
    c
  end   
  
end 


#Empty Case
empty_tree = Bst.new(nil)
p empty_tree.count_unival == 0
#=> true

#No Leaves Case
no_leaves = Bst.new(4)
p no_leaves.count_unival == 1
#=> true

#With 1 Level Case and Unival
one_level = Bst.new(4)
one_level.insert 5
one_level.insert 4
p one_level.count_unival == 2
#=> true

#With 1Level Case and equal nodes Unival
one_level = Bst.new(1)
one_level.insert 1
one_level.insert 1
one_level.insert 1
one_level.insert 1
p one_level.count_unival == 5
#=> true

## is unival
all_data = true
one_level.each { |node| all_data = all_data && node.data == one_level.data }
p all_data == true
#=> true