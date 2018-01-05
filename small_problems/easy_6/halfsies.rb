
=begin
Write a method that takes an 
Array as an argument, 
and returns two Arrays 
that contain the first half 
and second half of the original Array, 
respectively. If the original array 
contains an odd number of elements, 
the middle element should be placed 
in the first half Array.
=end
 
def halvsies(array)
  result = []
  x,y = array.count.divmod(2)
  result << array.slice!(0, x+y)
  result << array
  result
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

