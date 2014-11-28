# Set 

An overview of the Set data structure, how to implement one in Ruby, how it is currently implemented in MRI Ruby with a comparison to Java, a look into recent issues/pull request activity in MRI ruby and other variations of this data structure.

##What is a Set?

A Set is a data structure that represents a collection of objects that are _unordered_ and _distinct_. It has it roots in Mathematic Logic and Set Theory. 

It is considered an Abstract Data Type, since it is defined in terms of the operations on it not on how it is internally implemented. Its implementation can vary based on efficiency, variation in design or additional constraints. Sets can be implemented as Static, Dynamic, Sorted and most languages have several implementations.

The expected operations in a Set

-member? 
-union
-intersection
-difference
-subset

It's not commonly used in Ruby, probably because there is no literal notation like _array_ or _hash_. 
but Set needs to be created declaratively with "new".

```ruby
$ a = [1,2,3] #=> [1, 2, 3]
$ s = Set.new(["ariel","belle","peter pan"]) => #<Set: {"ariel","belle", "peter pan"}>
```
An array is a DS with an ordered collection of objects that may include duplicates

a = Set.new(["ariel","belle","peter pan"])
=> #<Set: {"ariel","belle", "peter pan"}>

But why does it matter and how is it really different from Array, and why can't the simple solution below be sufficient 
```ruby
$ a = [1,2,3,3] #=> [1, 2, 3]
$ a.uniq! #=> [1, 2, 3]  
```

The purpose is not so much to access data (although the Ruby Set includes enumerable and you can use each over the elements) as it is to check membership, that is, is something contained in a collection?. Also it is expected that the indivdual element, will not be modified once it is added to the set. If they are strings, Ruby freezes them. 

```ruby
$ s = Set.new(["ariel","belle","peter pan"]) => #<Set: {"ariel","belle", "peter pan"}>
$ s.each { |item| item[0]="c" }
RuntimeError: can't modify frozen String
	from (irb):11:in `[]='
	from (irb):11:in `block in irb_binding'
	from /usr/local/var/rbenv/versions/2.1.0/lib/ruby/2.1.0/set.rb:263:in `each_key'
	from /usr/local/var/rbenv/versions/2.1.0/lib/ruby/2.1.0/set.rb:263:in `each'
	from (irb):11
	from /usr/local/var/rbenv/versions/2.1.0/bin/irb:11:in `<main>'
```
    but if it's an object or a hash it can be modified and ruby does not prevent you
```ruby
$ s = Set.new([{a: 1}]) #=> #<Set: {{:a=>1}}>
$ s.each { |n| n[:a]=2 } #=> #<Set: {{:a=>2}}>
``` 
It's not _really_ immutable, it suggests that you use it as such.

Ruby not only provides the expected operations based on the names but also nice boolean aliases.
union |
intersection &
difference -

The Set has an XOR function which array does not have.
```ruby
$ [1,2,3] ^ [2,3,4]
=> NoMethodError: undefined method `^' for [1, 2, 3]:Array 
$ Set.new([1,2,3]) ^ Set.new(2,3,4) => #<Set: {4, 1}> 
``` 

One thing I found out about the Set is that the set equality distinguishes between decimal and integers.

```ruby
irb(main):019:0> Set.new([1,2,3]) == Set.new([1,2.0,3])
=> false
irb(main):020:0> Set.new([1,2,3]) == Set.new([1,2,3])
=> true
irb(main):021:0> 2 == 2.0
=> true
irb(main):022:0> [2] == [2.0]
=> true
irb(main):023:0> Set.new([1,2,3]) == Set.new([1,3,2])
=> true
``` 

## How to implement one in Ruby

To create a Set, we need to 

1.  Think about how to store it internally.
2.  What operations must the set perform
3.  How is uniqueness ensured, can we leverage another DS that handles uniqueness
4.  Should we make the elements of the Set immutable so they cannot be modified.
5.  TDD approach. 
6.  Do we need boolean style aliases to functions, such as "| & ^"

## How it is currently implemented in MRI Ruby

Set added in StdLib in Ruby 1.9.3 

In [MRI Ruby the Set][7] is not written in native C but implemented in ruby. It uses a hash for storage which allows it to use the built-in duplicate handling in the hash. It also include's the Enumerable module and thus leverages a bunch of free methods from that module.

Performance wise the set is as performant as a Hash, so O(1) for insert,delete,membersip


Ruby also has a SortedSet implementation. This implementation is different though and uses a [Red-Black Tree][8], to keep the data sorted and the performance therefore is log(n).
The SortedSet implementation was reviewed critically for its [implementation][6]

## Comparison with Java

Sets in Java are also implemented in a similiar way. They are even called [TreeSet][9] and the [HashSet][10] where TreeSet is similiar to Ruby's SortedSet and HashSet like Set.


## A look at recent changes/pull request 

There haven't been many recent significant changes in Ruby's Set implementaion. 
The `Set#intersect?` and `#disjoint?` functions were [added][11] a year or so ago

The Rails code uses this in a lot of places, including routing and caching. There are a couple of recent pull requests related to Sets in Rails for performance reasons.

[Remove Set.new to reduce rendering overhead in ERB][12], since overhead of constructing a Set is greater than overhead of Array#include? vs Set#include?

[Change Http::Cache::SPECIAL_KEYS from Array to Set][13] to improve performance

##  Data structures variations based on Sets

A [Bit Array][3] commonly used in systems programming can be used to implement a simple set as well. 

A [MultiSet][4] is used for counting number of entries in a Set.

A [Bloom Filter][5] is a probabilistic data structure used to check false positives 

##Conclusion

The goal was to have enough foundational understanding to firstly use Sets when we need them and then to contribute back to Rails and Ruby with improvements.


[1]: https://github.com/ruby/ruby/blob/ruby_2_0_0/lib/set.rb
[2]: http://www.sitepoint.com/guide-ruby-collections-ii-hashes-sets-ranges/
[3]: ../bitarray/Readme.md
[4]: ../multiset/Readme.md
[5]: ../bloomfilter/Readme.md
[6]: http://architecturalatrocities.com/post/23659800703/the-ruby-standard-library-is-a-disgrace
[7]: https://github.com/ruby/ruby/blob/trunk/lib/set.rb
[8]: https://github.com/skade/rbtree
[9]: http://docs.oracle.com/javase/7/docs/api/java/util/TreeSet.html#TreeSet
[10]: http://docs.oracle.com/javase/7/docs/api/java/util/HashSet.html
[11]: https://github.com/ruby/ruby/commit/bd304ed85bc2f3c0cc57334fe624fc0efa122cbc
[12]: https://github.com/rails/rails/pull/15917
[13]: https://github.com/rails/rails/pull/15744

