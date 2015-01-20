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
    @bpa[0,@max_key_count]
  end

  def get key
    keys.each_with_index do |k, i|
      return value(i) if key == k
    end
  end

  def full?
    !!keys[@max_key_count-1]
  end

  def insert key, value
    print "keys=#{keys}\n"
    insert_position = key_insert_position key
    puts "#{insert_position}=insert_position\n"
    raise ArgumentError.new "BPlusArray is filled already" unless insert_position < @max_key_count
    @bpa[insert_position] = key
    @bpa[value_position insert_position] = value
    p @bpa
  end

  def insert_child_at(key, left_child, right_child)
    ### when splitting a node the middle key and the child nodes he is associated with
    ### go the parent, which has to handle the correct insertion
    ### On creating the parent node it will not know of any children
    ### On adding any further parent one child will always be already known by the parent
    key_pos = key_insert_position key
    left_child_pos = value_position key_pos
    right_child_pos = left_child_pos + 1

    @bpa[key_pos] = key
    @bpa[left_child_pos] = left_child
    @bpa[right_child_pos] = right_child
  end


  private
  def key_insert_position key
    insert_position = keys.find_index do |it|
      print "it=#{it}\n"
      ret = it.nil? || key < it
      print "ret=#{ret}\n"
      ret
    end
  end


end
