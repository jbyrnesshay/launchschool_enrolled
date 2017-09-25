# require_relative "calculator_messages_simple.rb"
require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect
puts MESSAGES[:welcome]
exit
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two nubmers
# output the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

# check for integers only
def valid_number?(num)
  # num.match(/[0-9]/)
  # num.to_i.to_s == num
  # num.match(/^\d+$/)
  num.match(/^\d+\.?\d*$/)
   # /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end
def integer?(num)
  num.to_i.to_s == num
end
def float?(num)
  num.to_f.to_s == num 
end
def float_or_int?(num)
  integer?(num) || float?(num)
end
# check for floats or integers
def number?(num)
  num.match(/^d+\.?\d*$/)
end


def operation_to_message(op)
  spell_op =  case op
              when '1'
                "adding"
              when '2'
                "subtracting"
              when '3'
                'multiplying'
              when '4'
                'dividing'
              end
  puts "ok"
  spell_op
end

prompt(MESSAGES[:welcome])

name = ''
loop do
  name = Kernel.gets.chomp
  if name.empty?
    prompt(MESSAGES[:invalid_name])
  else
    break
  end
end

name(name)

prompt(MESSAGES[:hello])
loop do
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets.chomp
    if valid_number?(number1)

      break
    else
      prompt(MESSAGES[:invalid_num])
    end
  end
  # Kernel.puts(number1.inspect)
  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES[:invalid_num])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)
  operator = ''

  loop do
    operator = Kernel.gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES[:invalid_op])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              ((number1.to_f + number2.to_f)*  100).round / 100.0
            when '2'
              ((number1.to_f - number2.to_f) * 100).round / 100.0
            when '3'
             ((number1.to_f * number2.to_f) * 100).round / 100.0
            when '4'
            ((number1.to_f / number2.to_f) * 100).round / 100.0
            end
  if result.to_i == result.to_f
    result = result.to_i
  end
  result(result)
  prompt(MESSAGES[:result])
  prompt(MESSAGES[:try_again?])
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES[:goodbye])
