#How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']
 
test = arr.sort do |x, y|
   y.to_i <=> x.to_i 
end

puts test.inspect
 