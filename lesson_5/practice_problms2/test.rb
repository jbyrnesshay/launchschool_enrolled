require 'pry'
array = [5,4,3,2]

test = array.reduce(0) do |total, num|
  binding.pry
  total + num if num < 4
  binding.pry
end

p test