# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two nubmers
# output the result
require 'yaml'
require 'pry'
MESSAGES = YAML.load_file("calc_refact2.yml")
LANGUAGE = "en"

# puts messages[lang]["greeting"]
# puts messages

def message(message, lang=LANGUAGE)
  MESSAGES[lang][message]
end
PROFILE = Hash.new
def print_statement(*items)
  #string = ""
  #items.each do |item|
    # puts item
    # test if item is a string or not (for this purpose, a variable)
    # puts 'multiplying'.eql?('multiplying'.to_s) && message('multiplying')
    #  this doesn't need to be this

    # if item.eql?(item.to_s) && message(item)
=begin
    if item.is_a?(String) && message(item)
      item = message(item)
      # puts item
      # elsif !item.eql?(item.to_s
    elsif item.is_a?(Symbol)
      item = PROFILE[item]
    end
    string += item + " "
  end
=end
    string = make_statement_string(*items)
  
  make_prompt(string)
end

def make_statement_string(*items)
  string = ''
  # check if arguments are string or symbol
  # if string and if corresoponding entry in yaml dictionary
  # then use yaml value based on language setting, else if string it is its face-value
  # if symbol (i.e. user name), retrieve value at symbol from hash
  # ensuring name was identified as symbole rather than variable on print lines
  # avoids conflict between yaml dictionary and a user's accidentally entering a 
  # dictionary value as their name
  items.each do |item|
    if item.is_a?(String) && message(item)
      item = message(item)
      # puts item
      # elsif !item.eql?(item.to_ss
    elsif item.is_a?(Symbol)
      item = PROFILE[item]
    end
    string += item + " "
  end
  string
end
def make_prompt(statement)
  puts "=> #{statement}"
end
# prompt message("greeting")

def valid_num?(num)
  # num.to_i != 0
  float?(num) || integer?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_operator?(op)
  operators = %w(1 2 3 4)
  operators.include?(op)
end

def valid_name?(name)
  name.match(/[a-zA-Z]/)
end

def operation_to_message(op)
  case op
  when '1'
    "adding"
  when '2'
    "subtracting"
  when '3'
    "multiplying"
  when '4'
    "dividing"
  end

=begin
  test = {
    '1': message("adding")
    '2': message("subtracting")
    '3': message("multiplying")
    '4': message("dividing")
  }
  test[op.to_sym]
=end
end
number1 = ''
number2 = ''
operator = ''
name = ''
# puts message
loop do
  # prompt("Welcome to Calculator! Enter your name")
  print_statement "welcome"
  name = gets.chomp
  if name.empty?
    print_statement 'invalid', 'user_name'
  else
    # i add this to a hash because I strived for a simpler more elegant
    # way of preparing multiple values for a prompt statement
    # which could include a string literal which needs to be tested if it
    # matches yml or  a variable which will not be,
    # I decided that passing a symbol rather than the value of a
    # variable (which would be a string)
    # would allow me to differentiate within the method whether I needed
    # to call the YML contents on the string or not it avoids the soecial
    # case where someone might enter a name which is a YML message value
    PROFILE[:name] = name
    break
  end
end
print_statement 'greeting', :name
loop do
  loop do
    print_statement "first_number"
    number1 = Kernel.gets().chomp()
    break if valid_num?(number1)
    print_statement 'invalid', 'number'
  end

  # Kernel.puts(number1.inspect)
  loop do
    print_statement "second_number"
    number2 = Kernel.gets().chomp()
    break if valid_num?(number2)
    print_statement 'invalid', 'number'
  end

  operator_prompt = <<-MSG
  #{message 'operator_choice'}
      1) #{message 'add'}
      2) #{message 'subtract'}
      3) #{message 'multiply'}
      4) #{message 'divide'}
    MSG
  make_prompt operator_prompt
  loop do
    operator = Kernel.gets().chomp()
    break if valid_operator?(operator)
    print_statement 'operator_invalid'
  end

  print_statement operation_to_message(operator), 'operation_statement'
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

  def type_of_num(num)
    if float?(num)
      num.to_f
    else num.to_i
    end
  end
  # type_of_num allows proper calc results if user enters float values for nums
  calculation = case operator
                when '1'
                  type_of_num(number1) + type_of_num(number2)
                when '2'
                  type_of_num(number1) - type_of_num(number2)
                when '3'
                  type_of_num(number1) * type_of_num(number2)
                when '4'
                  number1.to_f() / number2.to_f()
                end
  print_statement 'result', calculation.to_s
  print_statement 'again?'
  continue = gets.chomp
  break unless continue.downcase.start_with?('y')
end
print_statement "thanks"
