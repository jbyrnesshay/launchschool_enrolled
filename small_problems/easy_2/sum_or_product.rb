
def prompt(message)
  puts ">> #{message}"
end
sum_or_product = ''
num = ''
def valid_num?(num)
  num.to_i.to_s == num
end
loop do 

  prompt "Please enter an integer greater than 0:"
  num = gets.chomp
  break if valid_num?(num)
  prompt "Sorry.  that is not a valid integer"
end

loop do
  prompt "Enter 's' to computer the sum, 'p' to computer the product."
  sum_or_product = gets.chomp
  break if ['s', 'p'].include? sum_or_product.downcase
  prompt "invalid entry.  must enter 's' or 'p'"
end


def compute_sum(range)
  range.inject(:+)
end

def computer_product(range)
  range.inject(:*)
end

def computation(num, op)
consecutive_integers = 1..(num.to_i)
  case(op)
  when 's'
    compute_sum(consecutive_integers)
  when 'p'
    computer_product(consecutive_integers)
  end
end


result = computation(num, sum_or_product)

if sum_or_product == 's'
  puts "The sum of the integers between 1 and #{num} is #{result}"
else 
  puts "The product of the integers between 1 and #{num} is #{result}"
end