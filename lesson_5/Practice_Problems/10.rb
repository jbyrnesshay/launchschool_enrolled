#Practice Problem 10

#Given the following data structure 
#and without modifying the original array, 
#use the map method to return a new array 
#identical in structure to the original 
#but where the value of each integer is incremented by 1.

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# method 1
test = array.map do |collection|
  collection.transform_values do |value|
   value + 1
  end
end

puts test.inspect

#method 2
test = array.map do |collection|
 new_values = collection.each do |k,v|
    collection[k] = v + 1
  end
  new_values
end

puts test.inspect

#method 3
#test = array.map do |collection|
array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
test2 = array.map do |collection|
  fun = {}
 collection.each do |k,v|
    v += 1
    fun[k] = v
  end
  fun
end

puts test2.inspect
