def oddities(array) 
  array.reject do |item|
    array.index(item).odd?
  end
end


#puts oddities([7, 8, 9, 5])
puts oddities([2, 3, 4, 5, 6]).inspect# == [2, 4, 6]
puts oddities(['abc', 'def']).inspect #== ['abc']
puts oddities([123]) #== [123]
puts oddities([]) #== []



def oddities2(array)
  odd_array = []
  index = 0
  while index < array.length
    odd_array << array[index]
    index +=  2
  end
  odd_array
end

puts
puts
puts oddities2([2, 3, 4, 5, 6]).inspect
puts oddities(['abc', 'def', 'ghi', 'jkl', 'mno']).inspect


def oddities3(array)
   odd_array = []
  index = 0
  loop do 
    break odd_array if index < array.length
    odd_array << array[index]
    index +=  2
  end
end

def oddities4(array)
  array.select {|i| array.index(i).even?}
end

puts oddities4([2,3,4,5,6]).inspect