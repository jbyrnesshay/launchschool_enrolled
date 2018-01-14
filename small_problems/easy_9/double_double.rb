=begin
  
rescue Exception => e
  
end
Double Doubles

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

Examples:
=end


def twice(num)
  num_string = num.to_s
  half1, half2 = num_string.slice(0..num_string.length/2 - 1), num_string.slice(num_string.length/2..-1)
  if half1 == half2 && num_string.length.even?
    #or if num.string.lengt> 1, ietake into account that if length == 1, half1==half2
    num 
  else 
    2*num
  end
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10


#alternate
def twice2(num)
  number_string = num.to_s
  center = num.to_s.length/2 
  left_half = center.zero? ? "" : number_string[0..center - 1]
  right_half = number_string[center..-1]
  return num if left_half == right_half  
  return num * 2
end

p twice2(37) == 74
p twice2(44) == 44
p twice2(334433) == 668866
p twice2(444) == 888
p twice2(107) == 214
p twice2(103103) == 103103
p twice2(3333) == 3333
p twice2(7676) == 7676
p twice2(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice2(5) == 10