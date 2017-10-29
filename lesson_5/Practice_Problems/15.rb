#Practice Problem 15

#Given this data structure write 
#some code to return an array which 
#contains only the hashes 
#where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
# method 1
selected = arr.map do |sub|
    sub.select do |x,y|
      y.all? {|num| num.even?}
    end
  end

  
puts selected.inspect

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
#method 2
test = arr.select do |sub|
  sub.all? do |k,v|
     v.all? do |num|
      num % 2 == 0
    end
  end
end
puts test.inspect