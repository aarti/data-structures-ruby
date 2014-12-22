require 'minitest/autorun'
require_relative 'bplustree'

class BplustreeTest < MiniTest::Unit::TestCase
  KV = Struct.new :key, :value
  
  def test_empty_btree
    b  = Bplustree.new(7)
    assert b.empty?
  end

  def test_root_with_one_value
    branching_factor = 7
    first = KV.new "1","one"
    b  = Bplustree.new(branching_factor)
    b.insert first.key, first.value

    assert_equal first.value, b.get(first.key)
  end

  def test_root_with_two_values
    skip 'write it'
    branching_factor = 7
    first = KV.new "1","one"
    second = KV.new "2", "My Second Data"
    b  = Bplustree.new(branching_factor)
    b.initialize_root first.key, first.value, second.key, second.value

    assert_equal first.value, b.get(first.key)
    assert_equal second.value, b.get(second.key)
  end

  def test_full_root
    skip 'write it'
    b  = Bplustree.new(branching_factor)
    b.initialize_root first.key, first.value, second.key, second.value

    values = 1.upto(7).map { |it| KV.new it.to_s, it.to_s + "value" }
    values.each do |it|
      b.insert it.key, it.value
    end

    values.each do |args|
      assert_equal args.value, b.get(args.key), "did not get expected value"
    end
  end

  #
  # # TODO
  # def test_insert_some_data
  #   first = KV.new "1","one"
  #   second = KV.new "2", "My Second Data"
  #   third =  KV.new "3", "data"
  #
  #   b  = Bplustree.new(3)
  #   b.initialize_root first.key, first.value, second.key, second.value
  #   b.insert third.key, third.value
  #
  #   assert b.root.is_leaf
  #   assert b.root.is_root, 'first node should be root'
  #
  #   assert_equal first.value, b.get(first.key)
  #   assert_equal second.value, b.get(second.key)
  #   assert_equal third.value, b.get(third.key)
  # end
  
  
end
