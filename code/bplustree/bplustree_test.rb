require 'minitest/autorun'
require_relative 'bplustree'

class BplustreeTest < MiniTest::Unit::TestCase
  KV = Struct.new :key, :value

  def test_initialize_btree
    branching_factor = 3
    first = KV.new "1","one"
    second = KV.new "2", "My Second Data"
    b  = Bplustree.new(branching_factor)
    b.initialize_root first.key, first.value, second.key, second.value

    assert b.root.is_leaf
    assert b.root.is_root, 'first node should be root'

    assert_equal first.value, b.get(first.key)
    assert_equal second.value, b.get(second.key)
  end
  
  # # TODO
  # def test_insert_some_data
  #   first = {"1"=> "one"}
  #   second ={"2"=> "My Second Data"}
  #   b  = Bplustree.new(3, first, second )
  #   third =  KV.new "4", data"
  #   b.insert third
  #   assert_equal false, b.root.is_leaf
  #   assert b.root.is_root, 'first node should be root'
  #   assert_equal first.first[1], b.get(first.first[0])
  #   assert_equal second.first[1], b.get(second.first[0])
  #   assert_equal third.first[1], b.get(third.first[0])
  # end
  
  
end
