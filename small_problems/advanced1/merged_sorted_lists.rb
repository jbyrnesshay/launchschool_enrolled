=begin
Merge Sorted Lists

Write a method that takes two sorted Arrays as arguments, 
and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. 
You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.
=end

=begin

def merge(array1, array2)
  results = []
  if !array1.empty?
    array1.each.with_index do |n, i|
      if 
      n < array2[i] ? results << n : results << array2[i]
    end


  end
end
=end

def merge(array1, array2)
  #results = []
  if array1.size >= array2.size
    helper(array1, array2)
  else helper(array2, array1)
  end

end

def helper(arrayx, arrayy)
  results = []
  #p arrayx
  #p arrayy
  one = 0
  two = 0
  smallestx= 0
  smallesty = 0
  arrayx.each.with_index do |n,i|
    smallestx= n
    arrayy.each_with_index do |x, j|
        smallesty= x  
        results << smaller
    end
  end
  # end
  #end
  results
end
p merge([1, 5, 9], [2, 6, 8]) 


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

