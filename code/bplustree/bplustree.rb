class Node
  attr_accessor :key_array, :bplusarray, :is_leaf, :is_root
  
  def initialize(bfactor, is_root=false)
    @key_array = Array.new(bfactor-1)
    @bplusarray = Array.new(bfactor)
    self.is_root = is_root
  end  
  
  def get key  
    key_array.each_with_index do |k, i|
      return bplusarray[i] if key == k      
    end  
  end
  
  def insert data
    # if is_root
    #   if  @key_array.empty?
    #     @key_array[0] = data.first
    #     @bplusarray[0] = data.last
    #   else
    #     
    #   end
    # else
    #   raise "foo"
    # end
  end
  
  def to_s
    "key_array = #{key_array}\n bplusarray= #{bplusarray}"
  end  
  
end
  
class Bplustree
  
  attr_accessor :bfactor, :root
  
  def initialize bfactor
    @bfactor = bfactor
  end

  def initialize_root k1,v1,k2,v2
    @root = Node.new(bfactor,true)
    @root.is_leaf = true
    @root.is_root = true
    # TODO: Refactor first into insert
    insert_sorted k1,v1,k2,v2
  end

  def insert_sorted k1,v1,k2,v2
    if k1 < k2
      @root.key_array[0]= k1
      @root.bplusarray[0]= v1
      @root.key_array[1] = k2
      @root.bplusarray[1] = v2
    else
      @root.key_array[0] = k2
      @root.bplusarray[0] = v2
      @root.key_array[1]= k1
      @root.bplusarray[1]= v1
    end
  end

  def to_s
    "bfactor=#{bfactor},root=#{root}"
  end
  
  def get key 
    root.get key
  end  
  
end
  
