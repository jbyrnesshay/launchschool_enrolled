=begin
Computationally, the Fibonacci series is a very simple series, 
but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number 
is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 
6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the 
first Fibonacci number that has the number of digits specified as an argument. 
(The first Fibonacci number has index 1.)

=end

 

def fib(index)
  return 1 if index == 1 || index == 2
  fib(index - 1) + fib(index - 2)
end

def fib2(index)
  array = []
  index.times do |x|
  if x == 0 || x == 1
    array << 1
  else array << array[x-1] + array[x-2]
  end
end
  array
end
#12,3 dig..17, 4 dig
#p fib2(8000)

 

def find_fibonacci_index_by_length(num_digits)
  first = 10 ** (num_digits - 1)  
  x = num_digits
  #p first
  result =[]
  loop do  
    result = fib2(x) 
    break if result.find {|o| o >= first}
    x += 1
  end
  result.index(result.last) + 1
end 


p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847