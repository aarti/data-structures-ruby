require 'minitest/autorun'
require_relative 'bit_array'

class BitArrayTest < MiniTest::Unit::TestCase
  def test_equal
    assert_equal "0", BitArray.new.to_s
  end 

  def test_set
    assert_equal "0001", BitArray.new.set(3).to_s
    assert_equal "1011", BitArray.new.set(0, 2, 3).to_s
    assert_equal "0100000000101", BitArray.new.set(1, 10, 12).to_s
  end

  def test_unset
    assert_equal "101", BitArray.new.set(0, 1, 2).unset(1).to_s
  end

  def test_get
    assert_equal 1, BitArray.new.set(1, 2).get(2)
    assert_equal 0, BitArray.new.set(12).get(11)
    assert_equal 1, BitArray.new.set(12).get(12)
  end

  def test_count
    assert_equal 3, BitArray.new.set(1, 2, 5).count
  end

  def test_iterate
    expected = [1, 1, 0, 1]
    BitArray.new.set(0, 1, 3).each do |bit|
      assert_equal expected.shift, bit
    end
    assert expected.empty?
  end
end