#Given this data structure, 
#return a new array of the same structure 
#but with the sub arrays 
#being ordered (alphabetically 
#or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]


test = arr.map do |sub_array|
  sub_array.sort do |x,y|
     y <=> x
  end
end

puts test.inspect