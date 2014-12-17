require 'minitest/autorun'
require_relative 'bplustree'

class BplustreeTest < MiniTest::Unit::TestCase
  def test_initialize_btree
    branching_factor = 3
    first = {"1"=> "one"}
    second ={"2"=> "My Second Data"}
    b  = Bplustree.new(branching_factor, first, second )
    assert_equal false, b.root.is_leaf
    p b.root
    assert_equal first.first[1], b.get(first.first[0])
    #assert_equal "root{[1,2][#{first},#{second}]}", b.to_s
  end
  
  # TODO
  def test_insert_some_data
  end
  
  
end