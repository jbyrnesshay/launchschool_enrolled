
def multiply(a, b)
  a * b
end

def square(num)
  multiply(num,num)
end

puts square(5) == 25
puts square(-8) == 64
puts square(7) == 30
 
 
=begin
for an integer "num" and a power
start
SET result = 1
WHILE power > 0
  IF power is odd
  result = result * num
  power = power - 1
  IF power is even
  result = result * num * num
  power = power - 2
  
=end

# using multiply method, for any power >= 0
=begin
original logical flow
def power(num, power)
  result = 1
  loop do     
    break if power == 0

    if power % 2 == 1
      result = multiply(result, num)
      power = power - 1
    else
      # power % 2 == 0 
     result = multiply(result, multiply(num,num))
     power = power - 2
    end
  end
  result
end
puts power(5,4)
=end
#efficiency
def power(num, power)
  result = 1
  loop do    
    break if power == 0
    result = multiply(result, num)
    power = power - 1
  end
  result
end