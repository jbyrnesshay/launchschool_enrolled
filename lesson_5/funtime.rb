arr = [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]
test = arr.map do |arr2|
  arr.pop
end

puts test.inspect