#Write a method that takes two arguments: the first is the starting number, and the second is the ending number. 
#Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", 
#if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

#Example:



def fizzbuzz(start, finish)
 (start..finish).each do |x|
  output = case 
    when x % 3 == 0 && x % 5 == 0
      'FizzBuzz'
    when x % 3 == 0
      'Fizz'
    when x % 5 == 0
      "Buzz"
    else x
    end
   
  
  puts output
  end
end



fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


#alternate
def fizzbuzz2(start, finish)
  array = []
  start.upto(finish) {|num| array << fizzbuzz_val(num)}
  puts array.join(', ')
end

def fizzbuzz_val(x)
  case 
    when x % 3 == 0 && x % 5 == 0
      'FizzBuzz'
    when x % 3 == 0
      'Fizz'
    when x % 5 == 0
      "Buzz"
    else x
    end
   
end
p fizzbuzz2(2,20)