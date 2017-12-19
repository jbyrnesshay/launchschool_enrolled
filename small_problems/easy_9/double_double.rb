=begin
A double number is a number with an even number of digits whose left-side 
digits are exactly the same as its right-side digits. 
For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, 
unless the argument is a double number; double numbers should be returned as-is.

=end


def twice(num)
  string = num.to_s
  size = string.size
  count = 0
  #string.each_char.with_index do |x, ind|
  #  if string[ind,ind+1] == string[size - 2 - ind, size - 1 - ind]
  (size /2 + 1 ).times do |ind|
     count += 1 if string[ind,2] == string[size - 2 - ind, 2]
  end
  if count.even? 
     num
  else num * 2
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
