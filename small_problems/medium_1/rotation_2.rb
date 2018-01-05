


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

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


#alternate

def rotate_rightmost_digits2(num, numrightdigits)
  head, tail = num.to_s[0...-numrightdigits], num.to_s[-numrightdigits..-1]
  (head << rotate_array(tail.chars).join).to_i
end

p rotate_rightmost_digits2(735291, 1) == 735291
p rotate_rightmost_digits2(735291, 2) == 735219
p rotate_rightmost_digits2(735291, 3) == 735912
p rotate_rightmost_digits2(735291, 4) == 732915
p rotate_rightmost_digits2(735291, 5) == 752913
p rotate_rightmost_digits2(735291, 6) == 352917