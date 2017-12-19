
=begin
Always Return Negative

Write a method that takes a number as an argument. 
If the argument is a positive number, return the negative of that number. 
If the number is 0 or negative, return the original number.
=end




def negative(num)
  num.positive? ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby


#alternative

def negative2(number)
  -number.abs
end

p negative2(5) == -5
p negative2(-3) == -3
p negative2(0) == 0 