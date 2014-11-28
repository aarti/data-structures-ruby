# n = Number of items in the filter
# p = Probability of false positives, float between 0 and 1 or a number indicating 1-in-p
# m = Number of bits in the filter
# k = Number of hash functions

require_relative '../bitarray/bit_array'
require 'digest'

class BloomFilter
  
  def initialize k: 1, m: 10
    raise RangeError, "k must be smaller than m" if k >= m
    raise ArgumentError, "k and m must be positive integers" if k < 1 || m < 1
    @k = k
    @m = m
    @n = 0
    @b = BitArray.new
  end
  
  # Probability of a false positive based on formula in wikipedia
  def false_positive_rate
    fp_rate = (1-(1-1/@m.to_f)**(@k.to_f*@n.to_f))**@k.to_f
    fp_rate
  end 
   
  ## Simplistic Hash, manages to set k bits but not a random distribution 
  def insert item
    @n += 1
    @k.times do |n|
      hash_val = digest item,n
      position = hash_val % @m
      @b.set position
    end  
    self
  end   
  
  def include? item
    item_included = false
    @k.times do |n|
      hash_val = digest item,n
      position = hash_val % @m
      return false if @b.get(position).zero?
    end     
    true
  end  
  
  private
  def digest item, n
    Digest::MD5.hexdigest( "#{item}#{n}" ).to_i(16)
  end  
  

end
