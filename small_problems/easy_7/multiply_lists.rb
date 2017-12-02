=begin

Write a method that takes two Array arguments 
in which each Array contains a list of numbers, 
and returns a new Array that contains the product 
of each pair of numbers from the arguments that 
have the same index. You may assume that 
the arguments contain the same number of elements.

=end

 def multiply_list(array1, array2)
  answer = []
  array1.each.with_index {|num, i| answer << num * array2[i] }
  answer
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
 

def multiply_withzip(array1, array2)
  array1.zip(array2).map {|x,y| x * y}
  #array1.zip(array2)
end

p multiply_withzip([3, 5, 7], [9, 10, 11]) == [27, 50, 77]