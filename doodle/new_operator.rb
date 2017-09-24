
range = 4..10
test = nil

range.each {|x| test ||= x; puts x}

puts test