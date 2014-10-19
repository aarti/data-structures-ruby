class MultiSet
  include Enumerable
  
  attr_reader :members
  
  def initialize enum={}
    @members = {}
    raise_error unless enum.class.include? Enumerable
    enum.each do |item|
      if @members.include?(item) 
        @members[item] += 1
      else
        @members[item] = 1
      end      
    end  
  end
  
  def each(&blk)
    @members.each(&blk)
  end
  
  def == other
    members.to_h == other.to_h 
  end

  def eql? other
    self == other
  end
  
  def to_h
    members.dup
  end  
  
  def to_set
    Set.new @members.keys
  end  
  
  def remove item
    if @members.include?(item) 
      @members[item] = @members[item] - 1
      if @members[item] < 1
        @members.delete(item)
      end
    end      
    self
  end 
  
  def add item
    if @members.include?(item) 
      @members[item] += 1      
    else
      @members[item] = 1
    end        
    self
  end 
  
  def empty!   
    @members.clear    
  end 
  
  def multiplicity item 
    @members[item] == 0 ? nil : @members[item]
  end
  
  def include? item
    @members.include? item 
  end
  
  def cardinality
    return 0 if @members.empty?
    @members.values.reduce(:+)
  end 
  
  def | other
    other.each do |k,v|
      if members.include? k
        members[k] = multiplicity(k) + other.multiplicity(k)
      else
        add k
      end     
    end
    self
  end   
  
  def & other
    members.each do |k,v|
      if other.include? k
        members[k] = [multiplicity(k), other.multiplicity(k)].min
      else
        remove k
      end     
    end 
    self
  end    
  
end  