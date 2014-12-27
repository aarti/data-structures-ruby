require 'minitest/autorun'
require_relative 'bplustree'
require_relative 'node'

class NodeTest < MiniTest::Unit::TestCase
  KV = Struct.new :key, :value
  

  def test_structure_of_root_after_split
     bfactor = 7
     root = Node.new(bfactor, is_leaf: true, is_root: true)
     values = 1.upto(6).map { |it| KV.new it.to_s, it.to_s + "value" }
     values.each do |it|
       root.insert it.key, it.value
     end
     values.each do |args|
       assert_equal args.value, root.get(args.key), "did not get expected value"
     end
     
     seven = KV.new "7", "seventh value"
     root.insert seven.key, seven.value
     
     # Split happens
     # Test Root after Split     
     refute root.is_leaf, "after split root is no longer a leaf"
   
     assert_equal 4.to_s, root.key_at(0), "expected key after split to be 4 for (bfactor=7)/2 for the generated node"
     assert_nil root.key_at(3), "after splitting root everything but the first key empty in the array"
     assert_nil root.key_at(5), "after splitting root everything but the first key empty in the array"
     #
     assert_kind_of Node, root.get(root.key_at(0)), "after splliting first record should be a node, root is #{root.inspect}"
     assert_kind_of Node, root.get(root.key_at(1)),  "after splitting second record should also be a node, root is #{root.inspect}"
     assert_nil root.bplus_array[5], "after splitting everything but first 2 records should be empty"
     
  end
end
