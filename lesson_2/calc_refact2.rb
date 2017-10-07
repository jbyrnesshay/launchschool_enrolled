# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two nubmers
# output the result
require 'yaml'
MESSAGES = YAML.load_file("calc_refact2.yml")
LANGUAGE = "sp"

#puts messages[lang]["greeting"]
#puts messages
def prompt(message)
  puts "=> #{message}"
end
def message(lang=LANGUAGE, message)
  MESSAGES[lang][message]
end
#prompt message("greeting")
def valid_num?(num)
  # num.to_i != 0
  num.to_i.to_s == num || num.to_f.to_s == num
end

def valid_operator?(op)
  operators = %w(1 2 3 4)
  operators.include?(op)
end

def valid_name?(name)
  name.match(/[a-zA-Z]/)
end

def operation_to_message(op)
=begin
  case op
  when '1'
    'adding'
  when '2'
    'subtracting'
  when '3'
    'multiplying'
  when '4'
    'dividing'
  end
=end

  test = {
    '1': "adding",
    '2': "subtracting",
    '3': "multiplying",
    '4': "dividing"
  }
  test[op.to_sym]
end
number1 = ''
number2 = ''
operator = ''
name = ''
# puts message
loop do
  #prompt("Welcome to Calculator! Enter your name")
  prompt message("greeting")
  name = gets.chomp
  if name.empty?
    prompt "sorry that is not a valid name"
  else
    break
  end
end
prompt "Hi #{name}"
loop do
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    break if valid_num?(number1)
    prompt "sorry that is not a valid number"
  end

  # Kernel.puts(number1.inspect)
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    break if valid_num?(number2)
    prompt "sorry that is not a valid number"
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide
    MSG
  prompt(operator_prompt)
  loop do
    operator = Kernel.gets().chomp()
    break if valid_operator?(operator)
    prompt "must choose 1, 2, 3, or 4"
  end

  prompt("#{operation_to_message(operator)} the two numbers")
  sleep(1)

=begin = Kernel.gets().chomp()
        break if valid_num?(number2)
        prompt "sorry that is not a valid number"
      end
      case operator
      when '1'
      if operator == '1'
        result = number1.to_i() + number2.to_i()
      elsif operator == '2'
        result = number1.to_i() - number2.to_i()
      elsif operator == '3'
        result = number1.to_i() * num"ber2.to_i()
  elsif operator == '4'
    result = number1.to_f() / number2.to_f()
  end
=end
  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end
  prompt("The result is #{result}")
  prompt("do you wish to calculate again? (y / n)")
  continue = gets.chomp
  break unless continue.downcase.start_with?('y')
end
prompt 'thank you for calculating'
