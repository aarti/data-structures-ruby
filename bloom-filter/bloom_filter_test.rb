require 'minitest/autorun'
require_relative 'bloom_filter'

class BloomFilterTest < MiniTest::Unit::TestCase

  def test_equal
    assert_equal , BloomFilter.new(5).to_s
  end 
  
  def test_set
    assert_equal "00100", BitArray.new(5).set(3).to_s
    assert_equal "00010", BitArray.new(5).set(4).to_s
    assert_equal "11100", BitArray.new(5).set([1,2,3]).to_s
  end

  def test_clear
    assert_equal "01000", BitArray.new(5).set([1,2]).clear(1).to_s    
  end  
  
  def test_count
    assert_equal 2, BitArray.new(5).set([1,2]).count 
  end  

end

k = hashes
m = size

seed ( generate hash functions )




bf = BloomFilter::Native.new(:size => 100, :hashes => 2, :seed => 1, :bucket => 3, :raise => false)
bf.insert("test")
bf.include?("test")     # => true
bf.include?("blah")     # => false

bf.delete("test")
bf.include?("test")     # => false

# Hash with a bloom filter!
bf["test2"] = "bar"
bf["test2"]             # => true
bf["test3"]             # => false

bf.stats