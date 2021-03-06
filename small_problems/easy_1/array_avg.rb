#puts average([1, 5, 87, 45, 8, 8]) == 25
#puts average([9, 47, 23, 95, 16, 52]) == 40


def average(array)
  array.sum / array.length
end

puts average([1, 5, 87, 45, 8, 3]) 
puts average([9, 47, 23, 95, 16, 52]) 

# or 

def average2(array)
  array.reduce(:+).to_f / array.length
end

puts average2([1, 5, 87, 45, 8, 6])