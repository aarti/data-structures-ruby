require_relative 'node' 

class Bplustree
  
  def initialize bfactor
    @bfactor = bfactor
  end

  def empty?
    @root.nil?
  end

  def to_s
    "bfactor=#{@bfactor},root=#{root}"
  end
  
  def get key 
    @root.get key
  end  
  
  def insert key, value
    unless @root
      @root = Node.new(@bfactor, is_leaf: false, is_root: true)
    end
    new_root = @root.insert key,value
    @root = new_root if new_root
  end

end
  
