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

The operations look simple enough to implement if we back it by an array. Why now simply use an array of booleans? Because this is not space efficient. Internally a boolean may be stored as a byte or more in ruby. 

The implementation is backed by an array and it is not very useful, just theoretical. Ideally you want to encode/pack the bits into an integer.

Ruby 2.1 leverages GMP, The GNU Multiple Precision Arithmetic Library, So the BigNum AND Fixnum have a bit_length method

  ```ruby
    irb(main):041:0> bitarray = 2**1000 -1
    => 10715086071862673209484250490600018105614048117055336074437503883703510511249361224931983788156958581275946729175531468251871452856923140435984577574698574803934567774824230985421074605062371141877954182153046474983581941267398767559165543946077062914571196477686542167660429831652624386837205668069375
    irb(main):042:0> bitarray.bit_length
    => 1000
    irb(main):119:0> a = (2**5)
    => 32
    irb(main):120:0> b = (1 << (5-3))
    => 4
    irb(main):121:0> a | b
    => 36
    irb(main):122:0> (a | b).to_s(2)
    => "100100"
    irb(main):123:0>
  ```

[Ruby forum discussion on using BitArray] [5]
[Java bitset performance][4]
Ruby has a [bitarray gem][1] which is written in ruby
Ruby has a native [bitset gem][3] which is written in C
Java has a [BitSet][2]
Python [bitarray][6] has the most extensive api
Bitset in [C++][8]

[1]: https://github.com/peterc/bitarray
[2]: http://docs.oracle.com/javase/7/docs/api/java/util/BitSet.html
[3]: https://github.com/tyler/bitset
[4]: http://java-performance.info/bit-sets/
[5]: https://www.ruby-forum.com/topic/4419629
[6]: https://github.com/ilanschnell/bitarray
[7]: https://gmplib.org/
[8]: http://www.cplusplus.com/reference/bitset/bitset/