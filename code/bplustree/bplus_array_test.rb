require_relative 'bplus_array'
require 'minitest/autorun'

class BPlusArrayTest < MiniTest::Unit::TestCase
  
  def test_create_correct_size_structure
    ba = BPlusArray.new 7
    assert_equal(13, ba.bpa.count)
  end

  def test_put_key_value_on_correct_position
    ba = BPlusArray.new 7
    key = 1
    value = 'val'
    ba.insert key, value
    assert_equal(key, ba.bpa[0], "key was not put on expected position")
    assert_equal(value, ba.bpa[6], "value was not put on expected position")
     assert_equal(13, ba.bpa.count)
  end
  
  def test_get
    ba = BPlusArray.new 7
    key1, value1 = 1 ,'val 1'
    ba.insert key1, value1
    assert_equal(value1, ba.get(key1), "key was not put on expected position")
    key2, value2 = 2 ,'val 2'
    ba.insert key2, value2

    assert_equal(value2, ba.get(key2), "key was not put on expected position")
    assert_equal(value1, ba.get(key1), "key was not put on expected position")
  end
  
  def test_correct_sbiling_position
    ba = BPlusArray.new 7
    sibling = Object.new
    ba.sibling_ptr = sibling
    assert_equal(13, ba.bpa.count)
    assert_equal(sibling, ba.bpa.last)
    assert_equal(13, ba.bpa.count)
  end

end