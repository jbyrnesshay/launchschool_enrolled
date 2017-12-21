
=begin
If you take a number like 735291, and rotate it to the left, you get 352917. 
If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. 
Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed 
in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate 
the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
=end


def rotate_array(array)
 array[1..-1] + [array[0]]
end
#def rotate_integer(integer)
  #rotate_array3(integer.to_s.chars).join.to_i
#end
#Write a method that can rotate the last n digits of a number. For example:

def rotate_rightmost_digits(num, num_rightdigits)
  digits = num.to_s.chars
  digits[-num_rightdigits..-1]= rotate_array(digits[-num_rightdigits..-1])
  digits.join.to_s.to_i
end

def max_rotation(num)
  length = num.to_s.length
  (length - 1).times {|i| num = rotate_rightmost_digits(num, length - i)}
  num
end
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

#alternate
def max_rotation2(num)
  length = num.to_s.size
  length.downto(2) {|slice| num = rotate_rightmost_digits(num, slice)}
  num
end
p max_rotation2(735291) == 321579
p max_rotation2(3) == 3
p max_rotation2(35) == 53
p max_rotation2(105) == 15 # the leading zero gets dropped
p max_rotation2(8_703_529_146) == 7_321_609_845

#without preexisting methods

def max_rotation3(num)
end

p max_rotation3(735291) == 321579
p max_rotation3(3) == 3
p max_rotation3(35) == 53
p max_rotation3(105) == 15 # the leading zero gets dropped
p max_rotation3(8_703_529_146) == 7_321_609_845
