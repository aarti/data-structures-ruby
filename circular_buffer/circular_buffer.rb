class CircularBuffer

  class BufferEmptyException < StandardError;  end;
  class BufferFullException < StandardError;   end;

  attr_reader :size

  def initialize(size)
    @size = size.to_i
    @buffer = []
  end
  
  def full?
     @buffer.size >= size
   end

  def write(data)
    raise CircularBuffer::BufferFullException if full?  
    write! data if data
  end

  def write!(data)
    read! if full?
    @buffer << data
  end
  
  def read
    raise CircularBuffer::BufferEmptyException if empty?
    read!
  end

  def read!
    @buffer.shift
  end

  def clear
    @buffer = []
  end  
  
  def to_a
    @buffer.dup
  end

  def empty?
    @buffer.empty?
  end

end