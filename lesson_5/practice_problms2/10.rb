#Given the following data structure and without modifying the original array, use the map method to return a new array 
#dentical in structure to the original but where the value of each integer is incremented by 1.

object = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]



new = object.map do |hash|
	new_hsh = {}
	hash.each do |key, value|
		value +=1
		new_hsh[key] = value
	end
	new_hsh
end

p new
p object
puts;puts

#alternate
object = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_obj = object.each_with_object([]) do |hsh, storage|
	test_hsh = {}
	 hsh.each do |key, value|
	  test_hsh[key] = value + 1
	 
	 end
	 storage << test_hsh
end
p new_obj
p object

#alternate
new_hash = {}
#object.each do |hsh|
#	new_hash << 
 
 
 













