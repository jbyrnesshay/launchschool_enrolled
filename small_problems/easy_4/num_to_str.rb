





def integer_to_string(num)
  values = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
          7 => '7', 8 => '8', 9 => '9'}
 string = ''
 num_copy = num
 length = 0
 while num_copy != 0
   num_copy = num_copy / 10
   length += 1
 end
 (1..length).each do |i|   
  value = num / (10 ** (length - i))
  num -= value * (10 ** (length - i))
  string << values[value]
 end
string
end

p integer_to_string(5455)
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'