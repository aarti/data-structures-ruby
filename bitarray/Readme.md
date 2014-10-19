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

The operations look simple enough to implement if we back it by an array. However





Ruby has a [bitarray gem][1] which is written in ruby
Ruby has a native [bitset gem][3] which is written in C
Java has a [BitSet][2]


[1]: https://github.com/peterc/bitarray
[2]: http://docs.oracle.com/javase/7/docs/api/java/util/BitSet.html
[3]: https://github.com/tyler/bitset
