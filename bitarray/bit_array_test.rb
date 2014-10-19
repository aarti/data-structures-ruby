require 'minitest/autorun'
require_relative 'bit_array'

class BitArrayTest < MiniTest::Unit::TestCase

  def test_equal
    assert_equal "00000", BitArray.new(5).to_s
  end 
  
  def test_set
    assert_equal "00100", BitArray.new(5).set(3).to_s
    assert_equal "00010", BitArray.new(5).set(4).to_s    
  end  

  def test_clear
    
  end  
    # b.set(5)
    # b.clear(5)
    # b.to_s #> "0000100000"
    # b.set([1,2,3])
    # b.to_s #> "1110100000"
    # b.count #> 4
  
end