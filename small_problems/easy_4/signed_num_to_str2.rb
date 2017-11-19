
def alt_to_string(num)
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

num = 542



def signed_to_str(num)
  sign = case 
         when num < 0 then '-'
         when num > 0 then '+'
         else ''
         end
  string = alt_to_string(num.abs)
  string.prepend(sign)
end

=begin
p alt_to_string(num) 
p signed_to_str(num)
p signed_to_str(0)
p signed_to_str(-457)((
=end
=begin
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
=end

def signed_to_str2(num)
  case num <=> 0
  when -1 then '-' + alt_to_string(num.abs)
  when +1 then '+' +  alt_to_string(num)
  else alt_to_string(num)
  end
end

p signed_to_str2(-54789)
p signed_to_str2(987423)
p signed_to_str2(0)

def signed_refactor(num)
  case  (num <=> 0)
  when +1 then sign = '+' 
  when -1 then sign = '-' and num = -num
  end
  # trick: handle nil value for sign, in lieu of including else in case statement
  sign.to_s + alt_to_string(num)
end

p signed_refactor(-54789)
p signed_refactor(987423)
p signed_refactor(0)

def signed_refactor2(num)
  #if < 0,   this happens,            else   this happens    
  num < 0 ? (sign = '-' and num = -num) : (num > 0 ? '+' : '')
  sign + alt_to_string(num) 
end

p signed_refactor2(-5242)

