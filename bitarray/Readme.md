#Bitarray

An array that compactly stores bits. It's useful when space efficiency is important. 


1.  Initialization with a size
  
  ```ruby
    b = BitArray.new(10) 
  ```  
2.  Operations the Bitarray must support

    - Set a bit location in the array
    - Clear a bit location in the array
  
  ```ruby
    b.set(5) 
    b.clear(5)
    b.to_s #> "0000100000"
    b.set([1,2,3])
    b.to_s #> "1110100000"
    b.count #> 4 
  ```  
## How to implement one in Ruby

The operations look simple enough to implement if we back it by an array. Why now simply use an array of booleans? Because they may not be space efficient. Internally a boolean may be stored as a byte or more in ruby. I couldn't actually find an answer on how it is stored in ruby.

The implementation is backed by an array and it is not very useful, just theoretical. Ideally you want to encode/pack the bits into a 32 bit integer and store it into an array, like the bitarray gem

[Ruby forum discussion on using BitArray] [5]
[Java bitset performance][4]
Ruby has a [bitarray gem][1] which is written in ruby
Ruby has a native [bitset gem][3] which is written in C
Java has a [BitSet][2]
Python [bitarray][6] has the most extensive api

[1]: https://github.com/peterc/bitarray
[2]: http://docs.oracle.com/javase/7/docs/api/java/util/BitSet.html
[3]: https://github.com/tyler/bitset
[4]: http://java-performance.info/bit-sets/
[5]: https://www.ruby-forum.com/topic/4419629
[6]: https://github.com/ilanschnell/bitarray