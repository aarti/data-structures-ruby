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
    branching_factor = 7
    first = KV.new "1","one"
    second = KV.new "2", "My Second Data"
    b  = Bplustree.new(branching_factor)
    b.insert first.key, first.value
    b.insert second.key, second.value

    assert_equal first.value, b.get(first.key)
    assert_equal second.value, b.get(second.key)
  end

  def test_full_root
    b  = Bplustree.new(7)
    values = 1.upto(7).map { |it| KV.new it.to_s, it.to_s + "value" }
    values.each do |it|
      b.insert it.key, it.value
    end

    values.each do |args|
      assert_equal args.value, b.get(args.key), "did not get expected value"
    end
  end

  def test_split_root
    b  = Bplustree.new(7)
    values = 1.upto(7).map { |it| KV.new it.to_s, it.to_s + "value" }
    values.each do |it|
      b.insert it.key, it.value
    end
    eight = KV.new "8", "eighth value"
    b.insert eight.key, eight.value
    
    assert_equal values[2].value, b.get(values[2].key)
    assert_equal eight.value, b.get(eight.key)
  end

  
end
