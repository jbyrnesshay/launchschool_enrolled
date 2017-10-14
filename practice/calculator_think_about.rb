require_relative "calculator_messages.rb"

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two nubmers
# output the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  # num.to_i != 0
  num.match(/[0-9]/)
  # num.to_i.is_a? Integer
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

prompt(Messages.welcome)

name = ''
loop do
  name = Kernel.gets.chomp
  if name.empty?
    prompt(Messages.invalid_name)
  else
    break
  end
end
Messages.name = name

prompt(Messages.hello)
loop do
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets.chomp
    if valid_number?(number1)

      break
    else
      prompt(Messages.invalid_num)
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
      prompt(nessage.invalid_num)
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
      prompt(Messages.invalid_op)
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end
  Messages.result = result
  prompt(Messages.result)
  prompt(Messages.try_again?)
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(Messages.goodbye)
