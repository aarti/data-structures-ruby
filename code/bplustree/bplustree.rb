class Node
  attr_accessor :key_array, :bplusarray, :is_leaf
  
  def initialize(bfactor)
    @key_array = Array.new(bfactor-1)
    @bplusarray = Array.new(bfactor)
  end  
  
  def get key  
    key_array.each_with_index do |k, i|
      return bplusarray[i] if key == k      
    end  
  end
  
  # def insert data
  #   key_array.each do |k, i|
  #     return bplusarray[i] if key == k
  #   end
  # end
  
  def to_s
    "key_array = #{key_array}\n bplusarray= #{bplusarray}"
  end  
  
end
  
class Bplustree
  
  attr_accessor :bfactor, :root
  
  def initialize bfactor, first, second
    @bfactor = bfactor
    @root = Node.new(bfactor)
    # TODO: Refactor first into insert
    if first.first[0] < second.first[0]
      @root.key_array[0]= first.first[0]
      @root.bplusarray[0]= first.first[1]
      @root.key_array[1] =second.first[0]
      @root.bplusarray[1] =second.first[1]
    else
      @root.key_array[0] =second.first[0]
      @root.bplusarray[0] =second.first[1]
      @root.key_array[1]= first.first[0]
      @root.bplusarray[1]= first.first[1]
    end
    # -----
    @root.is_leaf = false
  end

  def to_s
    "bfactor=#{bfactor},root=#{root}"
  end
  
  def get key 
    root.get key
  end  
  
end
  