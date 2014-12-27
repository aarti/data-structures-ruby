class BPlusArray
  attr_accessor :bpa

  def initialize bfactor
    @bpa = Array.new ( (bfactor * 2) - 1 ) { nil }
    @bfactor = bfactor
    @max_key_count = bfactor - 1 
  end
  
  def key idx
    @bpa[idx]
  end
  
  def value idx
    @bpa[value_position idx]
  end
  
  def value_position idx
    @max_key_count+idx
  end
  
  def sibling_ptr
    @bpa.last
  end
  
  def sibling_ptr= sibling
    @bpa[@bpa.count - 1 ] = sibling
  end
  
  def keys
    @bpa[0,@max_key_count - 1]
  end
  
  def get key
    keys.each_with_index do |k, i|
      return value(i) if key == k
    end
  end
  
  def insert key, value
    insert_position = keys.find_index { |it| it.nil? || key < it }
    raise ArgumentError.new "BPlusArray is filled already" unless insert_position < @max_key_count
    @bpa.insert insert_position, key
    @bpa.insert (value_position insert_position), value
  end
  
end