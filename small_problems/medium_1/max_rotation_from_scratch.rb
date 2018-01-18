=begin
  

If you take a number like 735291, and rotate it to the left, you get 352917. 
If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. 
Keep the first 2 digits fixed in place and rotate again to 321759. 
Keep the first 3 digits fixed in place and rotate again to get 321597. 
Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. 
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 
Assume you do not have the rotate_rightmost_digits or rotate_array methods. 
How would you approach this problem? Would your solution look different? 
Does this 3 part approach make the problem easier to understand or harder?


=end


def max_rotation(num)
  length = num.to_s.size
  test = num.to_s
  num.to_s.size.downto(2) do |x|
    head, tail = num.to_s[0...-length], num.to_s[-length..-1]
    new_tail = tail.to_s[1..-1] + tail.to_s[0]
    length -= 1
  end
end








p max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845