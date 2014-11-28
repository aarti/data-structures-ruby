# Storage is array
class Stack
  def initialize
    @store = Array.new
  end
  
  def pop
    @store.pop
  end
  
  def push(element)
    @store.push(element)
    self
  end
  
  def size
    @store.size
  end
end

s = Stack.new
s.push 1
s.push 2
s.push 3
p s       

s.pop   
p s       