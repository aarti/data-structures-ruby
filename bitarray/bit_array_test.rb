require 'minitest/autorun'
require_relative 'bit_array_take_2'

class BitArrayTest < MiniTest::Unit::TestCase

  def test_equal
    assert_equal "00000", BitArray.new(5).to_s
  end 
  
  def test_set
    assert_equal "00100", BitArray.new(5).set(3).to_s
    assert_equal "00010", BitArray.new(5).set(4).to_s
    assert_equal "11100", BitArray.new(5).set([1,2,3]).to_s
    assert_equal "100000000101", BitArray.new(12).set([1,10,12]).to_s
  end

  def test_clear
    assert_equal "01000", BitArray.new(5).set([1,2]).clear(1).to_s
  end

  def test_get
    assert_equal 0, BitArray.new(5).set([1,2]).get(3)
    assert_equal 0, BitArray.new(12).set([12]).get(11)
    assert_equal 0, BitArray.new(12).set([12]).get(1)
  end

  def test_count
    assert_equal 2, BitArray.new(5).set([1,2]).count
  end
  
  def test_iterate
    assert_equal ["0", "0", "0", "0", "0"],  BitArray.new(5).each {|n| puts n }
  end  

end