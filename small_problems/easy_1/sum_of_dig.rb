

def sum(num)
  add = 0
  while num >= 1
    add += num % 10
    num = num / 10
  end
  add
end

puts sum(123_456_789)