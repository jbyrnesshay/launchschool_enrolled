# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two nubmers
# output the result
require 'yaml'
MESSAGES = YAML.load_file("calc_refact2.yml")
LANGUAGE = "en"
 
#puts messages[lang]["greeting"]
#puts messages

def message(lang=LANGUAGE, message)
  MESSAGES[lang][message]
end
PROFILE = Hash.new  
def statement(*items)
  string = ""
  items.each do |item|
    #puts item
    #test if item is a string or not (for this purpose, a variable)
    #puts 'multiplying'.eql?('multiplying'.to_s) && message('multiplying')
     
    if item.eql?(item.to_s) && message(item)
      item = message(item)
      #puts item
    elsif !item.eql?(item.to_s)
      item = PROFILE[item]
     
    end
  
     string += item + " "
  end
  
  prompt(string)
end



def prompt(statement)
   
  puts "=> #{statement}"
end
#prompt message("greeting")
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
  statement "welcome"
  name = gets.chomp
  if name.empty?
    statement 'invalid', 'user_name'
  else
    PROFILE[:name] = name
    break
  end
end
statement 'greeting', :name
loop do
  loop do
    statement "first_number"
    number1 = Kernel.gets().chomp()
    break if valid_num?(number1)
    statement 'invalid', 'number'
  end

  # Kernel.puts(number1.inspect)
  loop do
    statement "second_number"
    number2 = Kernel.gets().chomp()
    break if valid_num?(number2)
    statement 'invalid', 'number'
  end

  operator_prompt = <<-MSG 
  #{message "operator_choice"}
      1) #{message "add"}
      2) #{message "subtract"}
      3) #{message "multiply"}
      4) #{message "divide"}
    MSG
  prompt operator_prompt
  loop do
    operator = Kernel.gets().chomp()
    break if valid_operator?(operator)
    statement 'operator_invalid'
  end

  statement operation_to_message(operator), 'operation_statement'
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
  calculation =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end
  statement 'result', calculation.to_s
  statement 'again?'
  continue = gets.chomp
  break unless continue.downcase.start_with?('y')
end
statement "thanks"
