

#Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

#You may assume that both input Arrays are non-empty, and that they have the same number of elements.

 


 def interleave(array1, array2)
  new = []
  size = array1.size
  size.times do |x|
    new.push(array1[x], array2[x])
  end
  new
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']



#alternative

def interleave2(array1, array2)
  new = []
 array1.each_with_index {|x, index| new << array1[index] << array2[index] }
 new
end


p interleave2([2,4,5], ['a','b','c'])



def interleavezip(array1, array2)
  array1.zip(array2).flatten
end

p interleavezip([2,4,5], ['a','b','c'])
p interleavezip([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']