class Deque
  Element = Struct.new(:datum, :next, :prev)

  def initialize
    @head = Element.new(nil, nil, nil)
    @head.prev = @head.next = @head
  end

  def push(datum)
    element = Element.new(datum, @head, @head.prev)
    @head.prev = @head.prev.next = element
    self
  end

  # Returns nil if the deque is empty
  def pop
    element = @head.prev
    element.prev.next = @head
    @head.prev = element.prev
    element.datum
  end

  # Returns nil if the deque is empty
  def last
    @head.prev.datum
  end

  def unshift(datum)
    element = Element.new(datum, @head.next, @head)
    @head.next = @head.next.prev = element
    self
  end

  # Returns nil if the deque is empty
  def shift
    element = @head.next
    element.next.prev = @head
    @head.next = element.next
    element.datum
  end

  # Returns nil if the deque is empty
  def first
    @head.next.datum
  end
end