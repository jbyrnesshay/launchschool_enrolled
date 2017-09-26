
range = 4..10
test = nil

range.each do |x|
  test ||= x
  puts x
end

puts test
