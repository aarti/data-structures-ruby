class Node
  attr_accessor :key_array, :bplusarray
  
  def initialize(bfactor, is_leaf:, is_root:)
    @key_array = Array.new(bfactor-1)
    @bplusarray = Array.new(bfactor)
    @is_root = is_root
    @is_leaf = is_leaf
  end  
  
  def get key  
    key_array.each_with_index do |k, i|
      return bplusarray[i] if key == k      
    end  
  end

  def root?
    @is_root
  end
  
  def insert key,value
    if root? && key_array.first.nil?
      @key_array[0] = key
      @bplusarray[0] = value
    else
      insert_position = @key_array.find_index { |it| it.nil? || key < it }      
      @key_array.insert insert_position, key
      @bplusarray.insert insert_position, value
    end
  end
  
  def to_s
    "key_array = #{key_array}\n bplusarray= #{bplusarray}"
  end  
  
end
