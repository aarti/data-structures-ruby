class Element
  
  attr_accessor :datum, :next
  
  def initialize(datum,next_element)
    @datum = datum
    @next = next_element
  end
  
  def reverse
    reversed = nil
    original = self
    next_element = nil
    while (original)
      reversed = Element.new(original.datum, next_element)
      next_element = reversed
      original = original.next
    end
    reversed  
  end
  
  def to_a
    Element.to_a(self)
  end  

  def from_a
    Element.from_a(self)
  end  
  
  def self.to_a(list)
    ret_arr = []
    the_list = list
    while (the_list)
      ret_arr << the_list.datum
      the_list = the_list.next
    end  
    ret_arr
  end
  
  def self.from_a(arr)
    list = nil
    prev_element = nil
    arr.each do |e|
      new_element = Element.new(e, nil) 
      if prev_element
        prev_element.next = new_element
      else  
        list = new_element
      end  
      prev_element = new_element
    end  
    list
  end
  
end