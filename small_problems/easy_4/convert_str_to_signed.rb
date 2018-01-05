

VALUES = {'0'=> 0, '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9}
 
def string_to_integer(string)
  digits = string.each_char.map {|char| VALUES[char]}
  value = 0
  digits.each do |num|
    value = value * 10 + num
  end
  value
end
  


def string_to_signed_integer(string)
 case string[0]
   when '-' then -string_to_integer(string[1..-1])
   when '+' then string_to_integer(string[1..-1])
   else string_to_integer(string)
 end
end


p string_to_signed_integer('4321') 
p string_to_signed_integer('-570') 
p string_to_signed_integer('+100') 

def refactored(string)
  sign = (string[0] == '-') ? -1 : 1
  string = string[1..-1] if (string[0] == '-' || string[0] == '+')
  string_to_integer(string) * sign
end

p refactored('4321')
p refactored('-570')
p refactored('+100')