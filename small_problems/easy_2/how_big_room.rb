




puts "Enter the length of the room in meters:"
length = gets.chomp
puts "Enter the width of the room in meters:"
width = gets.chomp
result = square_measure(length, width)
puts "The area of the room is #{result[meters]} (#{result[feet]}) square feet"