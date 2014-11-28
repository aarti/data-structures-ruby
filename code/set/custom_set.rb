class CustomSet
  include Enumerable

  attr_reader :members

  # Argument value must be enumerable, which will always have a to_a method
  # if it's nil then it also has a to_a method  
  def initialize(enum=[])
    @members= enum.to_a.uniq.dup
  end

  def size
    members.size
  end

  def each(&blk)
    members.each(&blk)
  end

  # Since Ruby does type conversion and we need to treat 2.0 distinct from 2
  #[1,2.0,2,3].index(2.0) #=> 1
  #[1,2.0,2,3].index(2) #=> 1
  # We need to modify with a block  
  def index(other)
    members.index { |item| item.eql?(other) }
  end

  def ==(other)
    return false unless other.class == self.class
    return false unless other.size ==self.size
    other.each do |item|
      return false unless index(item)  
    end   
    true
  end

  def eql?(other)
    self == other
  end

  def delete(item)
    members.delete(item) if index(item) 
    self
  end

  def difference(other)
    self.class.new(members - other.to_a)
  end

  def intersection(other)
    self.class.new(members & other.to_a)
  end

  def union(other)
    self.class.new(members | other.to_a)
  end

  def disjoint?(other)
    union(other).size == self.size + other.size
  end

  def subset?(other)
    self.size >= other.size && intersection(other) == other
  end

  def member?(n)
    index(n)
  end

  def put(item)
    members << item unless member?(item)
    self
  end

  def empty!
    self.members.clear
    self
  end

  # you don't want to return your instance variable directly! If you do, it can then be modified externally.
  def to_a
    members.dup
  end

  def dup
    self.class.new(members)
  end
  
  
  alias_method :|, :union
  alias_method :&, :intersection
  alias_method :-, :difference

end
