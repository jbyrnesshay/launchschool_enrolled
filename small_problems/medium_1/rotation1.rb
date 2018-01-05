
=begin
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:
=end


def rotate_array(array)
  first = array.first
  new = (1..array.length-1).map {|b| array[b] }
  new << first
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # =>



def rotate_array2(array)
  (1..array.length-1).map {|b| array[b] } << array.first
end

p rotate_array2([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array2(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array2(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array2(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # =>


def rotate_array3(array)
 array[1..-1] + [array[0]]
end

p rotate_array3([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array3(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array3(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array3(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # =>


def rotate_string(string)
  rotate_array3(string.chars).join
end


p rotate_string('university') == 'niversityu'


def rotate_integer(integer)
  rotate_array3(integer.to_s.chars).join.to_i
end
p rotate_integer(66894)