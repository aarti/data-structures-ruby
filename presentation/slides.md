# Data Structures & Ruby

By

## Aarti Parikh



```notes
Introduction, background
```
---


# Why study DS?

1.  Search, Organize and Manipulate information
2.  Reduces complexity 
3.  Efficiency in solving algorithms 
  
---
```notes
Data Structures are building blocks that enable us to search, organize and manipulate information so we can discover meaning and solve problems.
Maintainable code for complex problems
Picking the right ds can reduces complexity 

```

## Terms, Definitions & Properties

1. Linear Vs Non Linear
2. Abstract Data type 
3. Time, Space Complexity & Big O Notation 
5. Ordering in a data structure
6. Mutable vs Immutable
7. Concurrent
8. Duplication 

Learn more [NIST- Official dictionary](http://xlinux.nist.gov/dads//)



```notes
Linear Data structures,  Arrays & Lists
Non Linear Data structures, Trees, Graphs
Abstract Data type is a Model: Functional definition of a DS
separate from its implementation, set of functions and
constraints.
Properties ( how they store data)
What is the run time of ( insert, search, read )
What is the space complexity to store
Is ther ordering
How does the ds deal with concurrency
Are duplicates allowed.


```
---

## Big (O) notation

Growth rate of a function or a program

Finding a record in an array of n records is O(n)
```    
    # O(n) 
    x = 70
    a = [1..1000]
    a.each { |n| print n if n == x }  
```
```    
    # O(n^2) 
    a,b = (1..10),(1..10)
    a.each do |m|
      b.each do |n|
        p m*n
      end  
    end 
```
```    
    # O(n!) All possible permuattions of a string
    "ruby".chars.to_a.permutation.map &:join
    => ["ruby", "ruyb", "rbuy", "rbyu", "ryub", "rybu", "urby", "uryb", "ubry", "ubyr", "uyrb", "uybr", "bruy", "bryu", "bury", "buyr", "byru", "byur", "yrub", "yrbu", "yurb", "yubr", "ybru", "ybur"]
```

```notes
 The letter O is used because the growth rate of a function is also referred to as order of the function.
 Performance as data increases
 Number of loops
  
```
---
## Big (O) continued
  Classic example [Binary Search][1] in sorted array
  
```ruby    
    # O(log(n)) 
    class Array
      def binary_search(val, low=0, high=(length - 1))
        return nil if high &lt; low
        mid = (low + high) / 2
        case
          when self[mid] &gt; val then binary_search(val, low, mid-1)
          when self[mid] &lt; val then binary_search(val, mid+1, high)
          else mid
        end
      end
    end
```
```ruby
    # O(2^n) Recursive or Naive Fibonacci
    def fibonacci(n)
       n &lt;= 1 ? n :  fibonacci( n - 1 ) + fibonacci( n - 2 ) 
    end
```

---

##  Big(O) enables selection of DS

1. Insert
2. Search 
3. Retrieve
4. Space Used

[Handy Cheatsheet][2]

```notes
We look at big O properties of DS to determine the choice based on problem domain
  
```

---

## Common  DS

- Array
- Hash, Bloom Filter
- Stack, Queue, Dequeue
- Linked Lists, Circular Buffers
- Set, BitArray
- Tree, Binary Search Tree, Heap, Trie
- Graph

```notes
Grouped by properties, some of the one one we will look at
  
```

---

## DS in Ruby Core & Std

- Array
- Hash
- Set, SortedSet
- Matrix
- Vector
- Range 

```notes
Not that many to choose from  
```
---

## DS in Java


Java Collections Framework

<img src="./images/java-collections.png">

Extensive use of DS not in Java Core

  - [Apache commons Collection][3]  
  - [Google Guave][4]

Enough DS to choose from that there is a [flowchart][5] for selecting the right one.   
---

## Why DS not as distinct in Ruby

Ruby's API blends queues, stacks, sets, arrays and lists in a few classes, for a richer api.

---


## Array

- Stack/Queue/Dequeue all in one
- LIFO and FIFO methods
- O(1) operations  
   - pop
   - shift
- Ruby's Array has more then [100][6] methods!
- [Performance benchmarks for Array][7]

---

# Hash

- Key/Vaue Pair
- O(1) insert, search, delete
- Internally an array
- Uses a hash function & division method to fit data into an array

## How it works

[How the Hash works in Ruby][11]

## How to implement one in Ruby

[Hash implementation][2]

---


     
## Implementing DS in Ruby

- Understand Ruby API's and implementation better
- A nice refresher/ academic exercise
- Discover libraries

Let's start 

---

## Stack

- FIFO
- Operations supported
    - push
    - pop
    - peek
- Implementation varies
    - Array
    - LinkedList

[Stack Implementation using Array as storage][8]    
    
---
## Queue

- LIFO
- Operations supported
    - shift
    - unshift
- Implementation varies
    - Array
    - LinkedList
    
[Queue Implementation using Forwardable and delgates so Storage is again Array][9]  

---
## Deque  

- Double ended Queue 
- LIFO & FIFO
- Implementation with [storage as Linked List][10] 

---
# Set

- Unordered elements
- Distinct elements
- Tests for membership/inclusion not necessarily retrieval
- No set in Core till 1.9.3
- MRI Ruby implemented as a Hash
- Faster then [1,2,3].uniq! since it is just a Hash
- No literal notation, use Set.new
- The expected operations in a Set
    -member? 
    -union |
    -intersection & 
    -difference -
    -xor ^
- Used in rails for routing, caching etc.

---

# SortedSet

- Same properties of Set but ordered elements    
- MRI Ruby implements natively in C with a Red-Black Tree DS
- Sets in Java are also implemented in a similiar way. 
     - Java 's TreeSet ~ Ruby's SortedSet 
     - Java 's HashSet ~ Set

---
     
# CustomSet 

- Internally stored as an array
- Supports instantiation with any enumerable type
- Includes Enumerable and implements `each` to get some methods for free
- Return types should enable chaining
- Return types should not allow access to internal DS.

[Implementation][13]

---

# MultiSet

-  members allowed to appear more than once. 
      - `{a, a, b}`  
- the order of elements is irrelevant: The multisets 
      - {a, a, b} and {a, b, a} are equal.
- it provides the count or multiplicity of an element in the set. 
      - `count (a) = 2` 
- it can return the distinct elements of the set. 
      - `{a, b}`
- it returns the cardinality of the set, total number of elements including duplicates.   
      - `6`
      
[Implementation][14]
    
---

# BitArray

- Set like DS, but dense packed bits
- Implemented using an array as storage

[Implementation][15]

---

# Bloom Filter


- Check membership in a set
- Always gives a right answer if element is not present
- false positive if present
- Great for disk I/O
- Safe browsing
- Mix of hash & Set
- uses multiple hash functions to verify membership

---
# LinkedList


- No LinkedList in Ruby

- Unshift is expensive in Ruby, adding elements to end of list is cheaper

- http://www.sitepoint.com/rubys-missing-data-structure/

- a couple implementations
---

# Circular Buffer

- Implemented using an array as storage
- Overwrites after full


---
# Tree

- Hierarchical DS
- n-Ary tree
- Binary Tree
- Binary Search Tree
- Heap
- Trie
- quick terminolgy
     - root
     - leaf
     - level
     - path
     - siblings
- Real world usage, File system, RDBMS

---

# BST

- Binary tree with ordering
- left < right
- no duplicates,
- Search/Insert/delete O(log n)

---

# Heap


- Binary tree
- Max/Min at root
- No order left/right
- Max heap, min heap

---
# Trie


- A tree with prefix stored
- Space efficient when there is repetition
- Example storing urls

```
     www -> meetup -> com -> ruby -> sv -> 
                          -> java
                          -> hiking
                   -> net        
``` 
 
---


# Matrix

- Creating multi dimensional arrays in Ruby

```
      a =[][]
      a = Array.new() {} n dimensional matrix
```

- Instead use Matrix class

```
  Matrix.build(3, 3) {|row, col| 0 }
  => 0, 0, 0
     0, 0, 0
     0, 0, 0
```

---

# Graphs & other DS

- Graphs
    - Singly linked list is a basic graph
    - Tree with loops
- Sparse Matrices    
- Space Partitioning Trees 
- K-D tree

---

# Conclusion

[Github repo](https://github.com/aarti/data-structures-ruby) 

Please email feedback to aartiwithcode@gmail.com

Thanks for listening



[1]: http://rosettacode.org/wiki/Binary_search#Ruby
[2]: http://bigocheatsheet.com/
[3]: http://commons.apache.org/proper/commons-collections/
[4]: https://code.google.com/p/google-collections/
[5]: http://www.sergiy.ca/guide-to-selecting-appropriate-map-collection-in-java/
[6]: https://github.com/ruby/ruby/blob/trunk/array.c#L5683
[7]: http://anorwell.com/index.php?id=53
[8]: https://github.com/aarti/data-structures-ruby/blob/gh-pages/code/stack/stack.rb
[9]: http://www.java-samples.com/showtutorial.php?tutorialid=1125
[10]: https://github.com/aarti/data-structures-ruby/blob/gh-pages/code/deque/deque.rb
[11]: http://www.gotealeaf.com/blog/how-the-hash-works-in-ruby 
[12]: http://www.confreaks.com/videos/4153-gogaruco2014-reimplementing-ruby-s-hash
[13]: https://github.com/aarti/data-structures-ruby/blob/gh-pages/code/set/custom_set.rb
[14]: https://github.com/aarti/data-structures-ruby/blob/gh-pages/code/multiset/multiset.rb
[15]: https://github.com/aarti/data-structures-ruby/blob/gh-pages/code/bitarray/bit-array.rb




