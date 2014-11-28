class MultiSet
  include Enumerable

  def initialize enum=[]
    @members = {}
    raise ArgumentError, "enum must include the 'Enumerable' module" unless enum.kind_of? Enumerable
    enum.each do |item|
      add item
    end
  end

  def each &blk
    @members.each &blk
  end

  def == other
    @members.to_h == other.to_h
  end

  def eql? other
    self == other
  end
  
  def members
    @members.dup
  end  
  
  def to_a
    a = []
    @members.each do |key, count|
      count.times { a << key }
    end  
    a
  end  

  def to_set
    Set.new members.keys
  end

  def remove item
    if include? item
      @members[item] = @members[item] - 1
      @members.delete item if @members[item] < 1
    end
    self
  end

  def add item
    if include? item
      @members[item] += 1
    else
      @members[item] = 1
    end
    self
  end

  def clear
    @members.clear
  end

  def multiplicity item
    include?(item) ? @members[item] : 0
  end

  def include? item
    @members.include? item
  end

  def cardinality
    @members.values.reduce(0,:+)
  end

  def | other
    union = self.class.new(self.to_a)
    other.each do |key, count|
      count.times { union.add key }
    end
    union
  end

  def & other
    intersection = self.class.new
    @members.each do |key, count|
      if other.include? key
        max_count = [count, other.multiplicity(key)].min
        max_count.times { intersection.add key }
      end  
    end
    intersection
  end

  alias_method :to_h, :members

end

