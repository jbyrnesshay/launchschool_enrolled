#Write a method that takes one integer argument, which may be positive, negative, or zero. 
#This method return true if the number's absolute value is odd. You may assume that the argument 
#is a valid integer value.


def is_odd?(num)
  #num.abs % 2 != 0  
  num % 2 == 1
  # ruby modulus operator always return non-negative result if num on right is positive
  # ie, % is a modulus operator and "not a remainder operator as in some languages"
  # my first line was correct, but more properly per the proposed problem
  # check if odd, do not check if not even
end 
puts is_odd?(5)
puts is_odd?(8)
puts is_odd?(3)
puts is_odd?(-8)
puts is_odd?(-3)
puts is_odd?(0)
 

#if I were not sure if % was the modulus or remainder operator
#modulus returns non-negative if num on right is positive, remainder returns neg if num on left is neg
def is_odd2?(num)
  num.abs % 2 == 1
end
puts
puts "test 2"
puts is_odd2?(5)
puts is_odd2?(8)
puts is_odd2?(3)
puts is_odd2?(-8)
puts is_odd2?(-3)
puts is_odd2?(0)

#using Integer#remainder
#remainder operators return negative results if the number on the left is negative
def is_odd_remainder?(num)
  num.abs.remainder(2) == 1
  # x.remainder(y) means x-y*(x/y).truncate.
end
puts
puts "test3"
puts is_odd_remainder?(5)
puts is_odd_remainder?(8)
puts is_odd_remainder?(3)
puts is_odd_remainder?(-8)
puts is_odd_remainder?(-3)
puts is_odd_remainder?(0)

