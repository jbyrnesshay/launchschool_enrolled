#Given the following data structure and without modifying the original array, use the map method to return a new array 
#dentical in structure to the original but where the value of each integer is incremented by 1.

object = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]



new = object.map do |hash|
	thing = hash.map do |key, value|
		value +=1
		{key => value}
	end
	thing
end

p new


#alternate


object = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
new_object = []
object.each do |hash|
	new = hash.map do |key,  value|
		{key => (value + 1)} 
	end
	new_object << new
end

p new_object

#alternate
object = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
 
new_obj = object.each_with_object([]) do |hash, storage|
	 hash.each do |key, value|
	 	hash[key] = value + 1
	 end
	storage << hash
end
p new_obj
















