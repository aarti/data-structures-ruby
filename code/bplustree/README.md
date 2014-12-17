# B+ Tree

A B+Tree is a tree data structure that allows efficient lookup of ordered keys. It stores keys in blocks at each node on multiple levels. Only leaf nodes can have data. Every node that is not a leaf has the amount of keys it stores+ 1 children.

There are 3 types of children
- Data or Record
- Leaf Node
- Internal Node

Each node has two parallel structures of two arrays
The first array is b-1 and the second b.


# Implementation

Assumption that keys are numbers

- Step 1: Initialize 

- Step 2: split/insert


# Resources

Nice instructions for B+tree for MIT DB course assignment
http://mll.csie.ntu.edu.tw/course/database_f04/assignment/assignment6.pdf

http://blog.jcole.us/2013/01/10/btree-index-structures-in-innodb/

http://www.quora.com/B+-Trees

http://stackoverflow.com/questions/870218/b-trees-b-trees-difference



