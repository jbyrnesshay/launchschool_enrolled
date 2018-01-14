
=begin
We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, 
see the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument,
 and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; 
 that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.
=end
  
 


#[4,6,1,29,4]
 
#4 > 6 ?

def bubble_sort!(array)
  n = array.length
  while true
   swaps = false
   new_n = 0
   #(array.length - 1).times do |n|
  (n - 1).times do |n|
    if array[n] > array[n+1]
      swaps = true
      temp = array[n]
      array[n] = array[n+1]
      array[n+1] = temp
      new_n = n + 1
      #new_n, i.e., we do not need to sort beyond last sorted element on next pass
    end
   end
  break unless swaps
  end
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)



#alternative
def bubble_sort2!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort2!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort2!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort2!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)