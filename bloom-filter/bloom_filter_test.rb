require 'minitest/autorun'
require_relative 'bloom_filter'

class BloomFilterTest < MiniTest::Unit::TestCase

  # Verified probability formula and tests from http://hur.st/bloomfilter?n=1&p=0.01
  def test_stats
    assert_equal 0.01, BloomFilter.new(k: 7, m: 10).insert("a").false_positive_rate.round(2)
    b = BloomFilter.new(k: 2, m: 29)
    10.times { |n| b.insert(n) }
    assert_equal 0.25, b.false_positive_rate.round(2)
  end 
  
  def test_k_smaller_then_m
   assert_raises(RangeError) { BloomFilter.new(k: 10, m: 7)  }  
   assert_raises(RangeError) { BloomFilter.new(k: 20, m: 19)  }  
  end 
  
  def test_k_m_positive_integers
   assert_raises(ArgumentError) { BloomFilter.new(k: 0, m: 7) }  
   assert_raises(ArgumentError) { BloomFilter.new(k: -2, m: 19) }  
   assert_raises(ArgumentError) { BloomFilter.new(k: -3, m: -2) }  
  end  
  
  def test_include
    b = BloomFilter.new(k: 2, m: 100)
    b.insert "The Trumpet of the Swan"
    assert b.include?("The Trumpet of the Swan")
    refute b.include?("E. B. White")   
  end 
  
  def test_include
    b = BloomFilter.new(k: 2, m: 100)
    b.insert 1
    b.insert 2
    b.insert 3
    b.insert 4    
    assert b.include? 1 
    assert b.include? 2 
    assert b.include? 3 
    assert b.include? 4 
    refute b.include? 0   
  end  
   
  
end