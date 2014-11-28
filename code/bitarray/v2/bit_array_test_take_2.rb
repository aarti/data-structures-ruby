require 'minitest/autorun'
require_relative 'bit_array_take_2'

class BitArrayTest < MiniTest::Unit::TestCase

  def test_equal
    assert_equal "00000", BitArray.new(5).to_s
  end 
  
  def test_set
    assert_equal "01000", BitArray.new(5).set(3).to_s
    assert_equal "10000", BitArray.new(5).set(4).to_s
    assert_equal "01110", BitArray.new(5).set(1,2,3).to_s
    assert_equal "110000000010", BitArray.new(12).set(1,10,11).to_s
  end

  def test_unset
    assert_equal "00100", BitArray.new(5).set(1,2).unset(1).to_s
  end

  def test_get
    assert_equal 0, BitArray.new(5).set(1,2).get(3)
    assert_equal 0, BitArray.new(12).set(10).get(11)
    assert_equal 0, BitArray.new(12).set(10).get(1)
    assert_equal 1, BitArray.new(5).set(1).get(1)
  end

  def test_count
    assert_equal 2, BitArray.new(5).set(1,2).count
  end

  def test_iterate
    expected = [1, 1, 0]
    BitArray.new(3).set(1,2).each do |bit|
      assert_equal expected.shift, bit
    end
    assert expected.empty? # check that we looped the expected number of times  end
  end  
  
  def test_size
    assert_raises(ArgumentError){ BitArray.new(5).set(6) }
  end  

end