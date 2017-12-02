



=begin
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:
=end
=begin
te through array 
   [1,2,3,4]
   store = element
   iterate with reversed index1 
      [4,3,2,1]
=end
 %w(a b c d e)
def reverse!(array)
  store = []
  array.each.with_index do |x, i|
    store << array[array.size - 1 - i]
  end
  array.map!.with_index do |element, i|
    store[i]
  end

end

 
list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b c d e)
p list
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]
p list
 
list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []
 
 

 #alternate takea

 def reverses!(array)
  left = 0
  right = -1
  while left < array.size / 2
    
    array[left], array[right] = array[right], array[left]
    #array[right] =array[left]
    left += 1
    right -= 1
  end
  array
 end


 p reverses!(["e", "d", "c", "b", "a"])
list = [1,2,3,4]
result = reverses!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b c d e)
p list
reverses!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]
p list
 
list = ['abc']
reverses!(list) # => ["abc"]
p list == ["abc"]

list = []
reverses!(list) # => []
 

p list == []
 