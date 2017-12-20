
=begin
Write a method which takes a grocery list (array) of fruits with quantities 
and converts it into an array of the correct number of each fruit.

Example:
=end

def buy_fruit(array)
  array.map do |fruit, quantity|
    # when iterating through grouop of array objs, mutiple args can be used to access array values within each object
    [fruit] * quantity
  end.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  #["apples", "apples", "apples", "orange", "bananas","bananas"]


def buy_fruit2(array)
  array.map {|fruit, quantity| [fruit] * quantity}.flatten
end

p buy_fruit2([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  #["apples", "apples", "apples", "orange", "bananas","bananas"]


def buy_fruit3(array)
   #array.each_with_object([]) {|obj, result| obj.last.times {result<< obj.first}}
   array.each_with_object([]) {|(fruit, count), result| count.times {result<< fruit}}
end

p buy_fruit3([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  #["apples", "apples", "apples", "orange", "bananas","bananas"]