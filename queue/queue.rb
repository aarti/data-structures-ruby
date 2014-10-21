#  by James Edward Gray source http://www.java-samples.com/showtutorial.php?tutorialid=1125
class Queue
    extend Forwardable 

    def initialize
      @q = [ ]    # prepare delegate object
    end

    # setup prefered interface, enq() and deq()...
    def_delegator :@q, :push, :enq
    def_delegator :@q, :shift, :deq

    # support some general Array methods that fit Queues well
    def_delegators :@q, :clear, :first, :push, :shift, :size
end

q = Queue.new
q.enq 1, 2, 3, 4, 5
q.push 6

q.shift    # => 1
while q.size > 0
  puts q.deq
end

q.enq "Ruby", "Perl", "Python"
puts q.first
q.clear
puts q.first