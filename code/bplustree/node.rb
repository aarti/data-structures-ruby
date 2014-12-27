class Node

  def initialize(bfactor, is_leaf:, is_root:)
    @bpa = BPlusArray.new bfactor
    @is_root = is_root
    @is_leaf = is_leaf
    @bfactor = bfactor
  end

  def get key
    @bpa.get key
  end

  def root?
    @is_root
  end
  
  def leaf?
    @is_leaf
  end

  def insert key,value
    if root? && key_array.first.nil?
      @bpa.insert key,value
    else
      if key_array_is_full
       split
      else
        insert_position = @key_array.find_index { |it| it.nil? || key < it }
        @key_array.insert insert_position, key
        @bplus_array.insert insert_position, value
      end
    end
  end
  
  def key_array_is_full
    @key_array.reduce(0){ |sum,k| k.nil? ? sum : sum + 1 } >= (@bfactor-1)
  end
  
  def split
    right = create_right_node
    left = create_left_node( right )
    update_current_node(left, right)
  end
  
  def create_right_node
    right = Node.new(@bfactor,is_leaf: true, is_root: false)
    (split_upto-1).upto(@bfactor-1) do |i|
      right.insert(@key_array[i],@bplus_array[i]) unless @key_array[i].nil?
    end
    right
  end 
  
  def create_left_node( right )
    left = Node.new(@bfactor,is_leaf: true, is_root: false)
    0.upto(split_upto-2) do |i|
      left.insert(@key_array[i],@bplus_array[i])
    end
    left.sibling_ptr= right
    left
  end  
  
  def sibling_ptr=(node)
    @bplus_array[@bfactor-1] = node
  end  
  
  def update_current_node(left, right)
    @is_leaf = false
    key = first_key_of_right_child
    @key_array =  Array.new(@bfactor-1)
    @key_array[0] = key
    @bplus_array = Array.new(@bfactor)
    @bplus_array[0] = left
    @bplus_array[1] = right
  end
  
  def first_key_of_right_child
    @key_array[split_upto]
  end
  
  def split_upto
    ((@bfactor-1)/2.0).ceil
  end  
  
  def key_at idx
    @bplusarray[idx]
  end


  def to_s
    "key_array = #{key_array}\n bplus_array= #{bplus_array}"
  end

end
