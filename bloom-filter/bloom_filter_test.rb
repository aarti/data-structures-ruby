require 'minitest/autorun'
require_relative 'bloom_filter'

class BloomFilterTest < MiniTest::Unit::TestCase

  # Verified probability formulat and tests from http://hur.st/bloomfilter?n=1&p=0.01
  def test_stats
    assert_equal 0.01, BloomFilter.new(k: 7, m: 10).insert("a").false_positive_rate
    b = BloomFilter.new(k: 2, m: 29)
    10.times { |n| b.insert(n) }
    assert_equal 0.25, b.false_positive_rate
  end 
  
  def test_include
    b = BloomFilter.new(k: 2, m: 100)
    b.insert "The Trumpet of the Swan"
    assert_equal true, b.include?("The Trumpet of the Swan")
    refute b.include?("E. B. White")   
  end  
  
end