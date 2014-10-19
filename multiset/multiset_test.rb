require 'minitest/autorun'
require_relative 'multiset'
require 'set'

class MultiSetTest < MiniTest::Unit::TestCase

  def test_equal
    assert_equal MultiSet.new([1, 3]), MultiSet.new([3, 1])
  end
  
  def test_no_duplicates
    assert_equal MultiSet.new([1, 1]).to_set, Set.new([1])
  end  

  def test_remove
    assert_equal MultiSet.new([1,3]), MultiSet.new([3,2,1]).remove(2)
    assert_equal MultiSet.new([1,2,3]), MultiSet.new([3,2,1]).remove(4)
    assert_equal MultiSet.new([1,2,3]), MultiSet.new([3,2,1]).remove(2.0)
    assert_equal MultiSet.new([1,3]), MultiSet.new([3,2.0,1]).remove(2.0)
  end

  def test_empty
    assert_equal MultiSet.new, MultiSet.new([1,2]).clear
    assert_equal MultiSet.new, MultiSet.new.clear
  end

  def test_multiplicity
    assert_equal 2,MultiSet.new([1, 1, 2]).multiplicity(1)
    assert_equal 0,MultiSet.new([1, 1, 2]).multiplicity(4)
    assert_equal 0,MultiSet.new([1, 1, 2]).multiplicity(1.0)
    assert_equal 1,MultiSet.new([1, 1, 2]).multiplicity(2)
  end

  def test_membership
    assert MultiSet.new([1,2,3]).include?(2)
    assert MultiSet.new(1..3).include?(2)
    refute MultiSet.new(1..3).include?(2.0)
    refute MultiSet.new(1..3).include?(4)
  end

  def test_add
    assert_equal MultiSet.new([1,2,3,4]),
      MultiSet.new([1,2,4]).add(3)

    expected = {1 => 1, 2 =>1, 3 => 2}
    assert_equal expected, MultiSet.new([1,2,3]).add(3).to_h

    assert_equal MultiSet.new([1,2,3,3.0]),
      MultiSet.new([1,2,3]).add(3.0)
  end

  def test_to_set
    assert_equal Set.new, MultiSet.new.to_set
    assert_equal Set.new([1,2,3]), MultiSet.new([3,1,2]).to_set
  end
  
  def test_cardinality
    assert_equal 3,MultiSet.new([1, 1, 2]).cardinality
    assert_equal 0,MultiSet.new.cardinality
  end

  def test_union
    assert_equal MultiSet.new([3.0,3,2,1]), MultiSet.new([1,3]) | (MultiSet.new([2,3.0]))
    assert_equal MultiSet.new([3,1]), MultiSet.new([1,3]) | (MultiSet.new)
    assert_equal MultiSet.new([2]), MultiSet.new([2]) | (MultiSet.new)
    assert_equal MultiSet.new([]), MultiSet.new | (MultiSet.new)
  end
  
  def test_intersection
    assert_equal MultiSet.new([1,1]), MultiSet.new([1,1,1,3]) & (MultiSet.new([1,1,2]))
    assert_equal MultiSet.new([3,1]), MultiSet.new([1,3]) | (MultiSet.new)
    assert_equal MultiSet.new([2]), MultiSet.new([2]) | (MultiSet.new)
    assert_equal MultiSet.new([]), MultiSet.new | (MultiSet.new)
  end


end
