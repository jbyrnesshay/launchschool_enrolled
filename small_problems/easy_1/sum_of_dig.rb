

def sum(num)
  add = 0
  while num >= 1
    add += num % 10
    num = num / 10
  end
  add
end

test = 123_456_789
puts sum(test)


#or

def sum2(num)
  numbers = num.to_s.scan(/\d/)
  sum = 0
  numbers.each do |item|
    sum += item.to_i
  end
  sum
end

puts sum2(test)

#or

def sum3(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum3(test)


def thing(thing)
  if thing.is_a? String
    thing = thing.split()
  end
  thing.reduce(:+)
end


puts thing("I dont know")