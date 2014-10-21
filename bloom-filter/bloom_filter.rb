# n = Number of items in the filter
# p = Probability of false positives, float between 0 and 1 or a number indicating 1-in-p
# m = Number of bits in the filter
# k = Number of hash functions

require_relative '../bitarray/bit_array_take_2'
require 'digest'

class BloomFilter
  
  def initialize k: 1, m: 10
    @k = k
    @m = m
    @n = 0
    @b = BitArray.new(@m)
  end
  
  # Probability of a false positive based on formula in wikipedia
  def false_positive_rate
    fp_rate = (1-(1-1/@m.to_f)**(@k.to_f*@n.to_f))**@k.to_f
    p fp_rate
    fp_rate.round(2)
  end 
   
  def insert item
    @n += 1
    @k.times do |n|
      hash_val = Digest::MD5.hexdigest( item.to_s + n.to_s ).to_i(16)
      position = hash_val % @m
      @b.set position
    end  
    self
  end   
  
  def include? item
    @k.times do |n|
      hash_val = Digest::MD5.hexdigest( item.to_s + n.to_s ).to_i(16)
      position = hash_val % @m
      return true if @b.get(position) == 1
    end     
    return false
  end  

end
