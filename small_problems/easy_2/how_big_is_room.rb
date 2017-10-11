
SQ_MTR_TO_SQR_FT = 10.7639
def square_measure(length_meters, width_meters)
  measure = Hash.new
  measure[:meters] = (length_meters.to_f * width_meters.to_f).round(2)
  measure[:feet] = (measure[:meters] * SQ_MTR_TO_SQR_FT ).round(2)
  measure
end



puts "Enter the length of the room in meters:"
length_meters = gets.chomp
puts "Enter the width of the room in meters:"
width_meters = gets.chomp
result = square_measure(length_meters, width_meters)
puts "The area of the room is #{result[:meters]} meters (#{result[:feet]} square feet)"