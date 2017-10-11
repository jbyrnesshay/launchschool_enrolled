

five_numbers = []
num = ''
test_num = ''
def valid_num?(num)
  num.to_i.to_s == num
end
def prompt(message)
  puts "==> #{message}"
end
def print_num(num)
  case num
  when 1
    '1st'
  when 2
    '2nd'
  when 3
    '3rd'
  else
    num.to_s + 'th'
  end
end

5.times do |index|
  loop do 
    count = index + 1
    prompt "Enter the #{print_num(count)} number"
    num = gets.chomp
    break if valid_num?(num)
    prompt "sorry, you must enter a valid integer"
  end
    five_numbers << num
end

loop do 
  prompt "Enter the last number: "
  test_num = gets.chomp
  break if valid_num?(num)
  prompt "sorry, you must enter a valid integer"
end

if five_numbers.include?(test_num)
  prompt "The number #{test_num} appears in #{five_numbers.inspect}"
else 
  prompt "The number #{test_num} does not appear in #{five_numbers.inspect}"
end
