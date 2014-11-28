class Node
  
  attr_accessor :data, :next_node, :visited
  
  def initialize(data,next_node)
    @data =data
    @next_node = next_node
  end
    
end




class LinkedList
  
  attr_accessor :head
  
  def addfirst(node)
    node.next_node = @head if (@head)
    @head = node
  end  
  
  def add(node)
    unless head
      @head = node 
      return
    end
    prev_node = head
    curr_node = head.next_node   
    while (curr_node)  do
      prev_node = curr_node
      curr_node = curr_node.next_node
    end
    prev_node.next_node = node
    p @head
  end 
  
  def delete(node) 
    return unless @head && node
    prev_node = nil
    curr_node = @head 
    while (curr_node)  do
      if curr_node == node then
        if prev_node then
          prev_node.next_node = curr_node.next_node
          break
        else  
          @head = nil
        end  
      else 
        prev_node = curr_node
        curr_node = curr_node.next_node 
        p curr_node.data
        p "\n"
      end  
    end
  end
  
  def traverse(node, nodes=[])
    if node
      nodes << node
      curr_node = node.next_node 
      if curr_node
        raise "Loop found at #{curr_node.data}" if nodes.include?(curr_node)
        traverse(curr_node, nodes)
      end
    end  
  end  

  def traverse_findloopwithhash(node, nodes={})
    if node
      p node.data
      nodes[node]=node
      curr_node = node.next_node 
      if curr_node
        raise "Loop found at #{curr_node.data}" if nodes.has_key?(curr_node)
        traverse_findloopwithhash(curr_node, nodes)
      end
    end  
  end  
  
  def traverse_markvsisitednodes(node)
    if node
      p node.data
      node.visited = true
      curr_node = node.next_node 
      if curr_node
        raise "Loop found at #{curr_node.data}" if curr_node.visited
        traverse_markvsisitednodes(curr_node)
      end
    end  
  end 
  
  def traverse_floyd(node)
    if node
      slow = node
      fast = node
      while ( slow && fast && fast.next_node)
        slow = slow.next_node
        fast = fast.next_node.next_node
        p slow
        p fast
        raise "Loop found at #{slow.data}" if ( slow == fast )
      end
    end  
  end  

end  


l = LinkedList.new()
l.addfirst(Node.new("2",nil))
l.add(Node.new("4",nil))
n = Node.new("1",nil)
l.add(n)
l.add(Node.new("3",n))
l.traverse_floyd(l.head)
#l.add(Node.new("5",nil))
#l.delete(n)
#l.traverse(l.head)

