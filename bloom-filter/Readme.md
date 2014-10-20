# Bloom Filter

[Wikipedia][6] describes a Bloom filter as a space-efficient probabilistic data structure that is used to test whether an element is a member of a set. It uses multiple hash functions to determine membership in a set.

When an element is added to a filter, a subsequent membership test will definitely return True. However as more elements that are added to the set, the probability of false positives will increase. Elements are always added to the set, never removed.

## Implementations

A nice [interactive tutorial][1] on the bloom filter
[Java][2] implementation
[Another Java][3] implementation but with less functionality
[Ruby][4] implementation

## Usage

1. Performance when accessing data. Good to check if data exists before accesing physical disk, so there is less disk I/O 
2. [Safe browsing chromium][5]

## How to implement one in Ruby

We need an array to store the results of the hash. We need a hash function, We can use cryptographic hash md5, sha1 from Ruby

```ruby
   bloomfilter = 


```



[1]: http://billmill.org/bloomfilter-tutorial/
[2]: https://github.com/magnuss/java-bloomfilter
[3]: http://blog.locut.us/2008/01/12/a-decent-stand-alone-java-bloom-filter-implementation/
[4]: https://github.com/igrigorik/bloomfilter-rb
[5]: https://github.com/chromium/chromium/tree/c4625eefca763df86471d798ee5a4a054b4716ae/chrome/browser/safe_browsing
[6]: http://en.wikipedia.org/wiki/Bloom_filter
