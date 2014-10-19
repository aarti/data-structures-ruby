# MultiSet

It is a set in which members are allowed to appear more then once. The number of times an element belongs to the multiset is the multiplicity of that member. The total number of elements in a multiset, including repeated memberships, is the cardinality of the multiset. For example, in the multiset {a, a, b, b, b, c} the multiplicities of the members a, b, and c are respectively 2, 3, and 1, and the cardinality of the multiset is 6. [Source][2]


1.  members allowed to appear more than once. {a, a, b}
2.  the order of elements is irrelevant: The multisets {a, a, b} and {a, b, a} are equal.
3.  it provides the count or multiplicity of an element in the set. `count (a) = 2` 
4.  it can return the distinct elements of the set. {a, b}
5.  it returns the cardinality of the set, total number of elements including duplicates. `6`

A multiset is not a hash but could be implemented as one, it could also be implemented as two arrays.

Google's Guava library provides a great explanation of [MultiSet][3], with several different implementations backed by a Hash, a Tree and a LinkedList. It also has an implementation with concurrency support.

Clojure also has a [MultiSet][4] which provides all of the functionality with _only_ 157 lines! 

Ruby also has a [MultiSet][5] library

## How to implement one in Ruby

To create a MultiSet, we will take the TDD approach and identify what methods we need

The MultiSet api must allow

1.  Initialization with an array, or with a Range, or a Hash
  
  ```ruby
    MultiSet.new([1,2,3,3]) 
    MultiSet.new([1..6])
    MultiSet.new({"1"=>1, "2"=>1, "3"=>2})
  ```  
2.  Operations the multiset must support
  
  ```ruby
    m = MultiSet.new([1,2,3,3]) 
    m.multiplicity(3) == 2
    m.multiplicity(2) == 1
    m.multiplicity(4) == 0
    m.cardinality == 4
    m.remove(1)
    m.add(2)
    m.include?(2)
    m.to_set returns a Set object 
    m.to_a returns [1,2,3,3]
    m.to_h {"1"=>1, "2"=>1, "3"=>2}
    m1 == m2
    m1 | m2 (union)
    m1 & m2 (intersection)
    m1.subset? m2 (subset)
    m1 * m2 (cartesian) 
  ```  

3. What the api returns is important
   It should not allow modification of internal data structure
   Union, Intersection etc should return new object instances
   Initializer should only allow enumerable types, or even only array or set type.
  
  
## Practical Examples of  Multiset

1. Shopping Cart, with items and quantity
2. Prime Factors of a number
    `120 = {2, 2, 2, 3, 5}.`
    
## Open questions    
    
1. What should the return type of the cartesian product be

  In Math it is
    `{1,1}*{1,2} = {(1,1),(1,1),(1,2),(1,2)}`    


[1]: https://github.com/maraigue/multiset
[2]: http://en.wikipedia.org/wiki/Multiset
[3]: https://code.google.com/p/guava-libraries/wiki/NewCollectionTypesExplained#Multiset
[4]: https://github.com/achim/multiset