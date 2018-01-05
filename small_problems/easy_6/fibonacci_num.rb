
=begin

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that
the first 2 numbers are 1 by definition, and each subsequent number is the sum of the 
two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at
 an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075
 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number
that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

Examples:

=end

# this recursion is messing up
=begin
def fib(num)
  if num == 1 || num == 2
    return 1 
  else
    fib(num - 1) + fib(num - 2)
  end
end
#p fib(40)
=end

# fib num index
def fib2(num)
  array = []
  thing = 0
  num.times do |x|
    if x == 0 || x == 1
      array << 1 
      thing += 1
    else 
      
      
       thing = (array[x - 1] + array[x - 2])
       array << thing
    end

  end
  #thing
  array
  
end
puts
p fib2(45)
puts

# num is the num of digit places desired
# return the index of the first fib number with this many digit places
# find a fibonacci index such that it has num decimal places
=begin
def find_fibonacci_index_by_length(num)
   n = 0
   floor = 10 ** (num - 1)
    loop do 
     
     break if fib2(floor) >= floor
     #break if result.to_s.size == num
    #break if result > 10 ** (num - 1)
     n += 1
  end
  n
end
=end

def find_fibonacci_index_by_length(num)
  lim = num * 5 - (num / 5)
    array = fib2(lim)
     
    array.index {|m| m.to_s.size >= num} + 1
end
 
p find_fibonacci_index_by_length(2)
puts
puts
puts
p find_fibonacci_index_by_length(10000)
=begin
p find_fibonacci_index_by_length(2) == 7

p find_fibonacci_index_by_length(10) == 45 (ie, feb2(45) >= 10 ** (10-1)) <= fib2(45)
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
=end
=begin
te a method that calculates and returns the index of the first Fibonacci number
that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

=end