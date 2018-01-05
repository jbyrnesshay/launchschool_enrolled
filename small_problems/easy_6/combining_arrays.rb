

=begin
Write a method that takes two Arrays 
as arguments, and returns an Array 
that contains all of the values from 
the argument Arrays. There should be 
no duplication of values in the returned 
Array, even if there are duplicates in
S the original Arrays.
=end
 
def merge(array1, array2)
  (array1 + array2).uniq!
   
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


def merge_alternate(array1, array2)
  array1 | array2
  # | returns the set union of the 2 arrays
end

p merge_alternate([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]