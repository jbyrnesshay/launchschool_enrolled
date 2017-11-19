
num = 542
def integer_to_string_alt(num)
  array = []
  value = 1
  until num < 1
    value = num % 10
    array.unshift(value)
    num = num / 10
  end
  string = array.join
end
#p integer_to_string_alt(num)


def integer_alt_to_string(num)
  values = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
          7 => '7', 8 => '8', 9 => '9'}
  string = ''
    loop do  
      num, rem = num.divmod(10)
      string.prepend(values[rem])
      break if num == 0
    end
  string
end

p integer_alt_to_string(num) 

def integer_to_string(num)
  values = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
          7 => '7', 8 => '8', 9 => '9'}
  string = ''
  num_copy = num
  length = 0
  loop do  |i|
    num_copy = num_copy / 10
    length += 1 
    break if num_copy == 0
  end

  (1..length).each do |i|
    value = num / (10 ** (length - i))
    num -= value * (10 ** (length - i))
    string << values[value]
  end
  string
end

p integer_to_string(95455)
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'