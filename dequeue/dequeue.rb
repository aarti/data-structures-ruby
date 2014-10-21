class Element

  attr_accessor :datum,  :prev , :next

  def initialize(datum,next_element=nil, prev_element=nil)
    @datum = datum
    @next = next_element
    @prev = prev_element
  end

end

class Deque

  attr_reader :first, :last

  def push(datum)
    if @last.nil?
      @last = Element.new(datum)
      @first = @last
    elsif @last == @first
      @last = Element.new(datum,@first)
      @first.prev = @last 
    else
      prev = @last
      @last = Element.new(datum,prev)      
      prev.prev = @last
    end  
  end

  def pop
    datum = @last.datum
    @last = @last.next if @last
    datum
  end

  def shift
    datum = @first.datum
    @first = @first.prev
    @first.next = nil  if @first
    datum
  end

  def unshift(datum)
    if @last.nil?
      @last = Element.new(datum)
      @first = @last
    elsif @last == @first
      @first = Element.new(datum,nil,@last)
      @last.next = @first
    else
      prev = @first
      @first = Element.new(datum,nil, prev) 
    end   
  end  

end