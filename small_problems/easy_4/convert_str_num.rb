
def string_to_integer(string)
  tens_places = string.size - 1
  number = 0
  string.each_char.with_index do |char, index|
      number += convert_value2(char) * (10 ** tens_places)
      tens_places -= 1
  end
  number
end

#alternative to use hash 
def convert_value2(string)
  values = {'0'=> 0, '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9}
  values[string]
end


def string_to_int2(string)
  digits = string.each_char.map {|char| convert_value2(char)}
  value = 0
  digits.each do |num|
    value = value * 10 + num
  end
  value
end

def convert_value(string)
  case string
  when '0'
    0
  when '1'
    1
  when '2'
    2
  when '3'
    3
  when '4'
    4
  when '5'
    5
  when '6'
    6
  when '7'
    7
  when '8'
    8
  when '9'
    9
  end
end


def hex_to_integer(string)
  values = {'0'=> 0, '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, 
            '9'=> 9, 'A' => 10, 'B'=>11, 'C'=>12, 'D'=>13, 'E'=>14, 'F'=>15}
  nums = string.each_char.map do |char|
          values[char]
        end
  value = 0
  nums.each do |num|
    value = value * 16 + num 
  end
  value
end



p string_to_integer('4321') 
p string_to_integer('570') 
p string_to_integer('45874')


p string_to_int2('4321') 
p string_to_int2('570') 
p string_to_int2('45874')

p hex_to_integer('D1CE')
p hex_to_integer('4D9F')