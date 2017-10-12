def prompt(message)
	puts "==> #{message}"
end


second_num = ''

def valid_num?(num)
	integer?(num) || float?(num)
end
def integer?(num)
	num.to_i.to_s == num
end
def float?(num)
	num.to_f.to_s == num
end

prompt("Enter the first number")
first_num = gets.chomp

loop do 
	prompt("Enter the second number")
	second_num = gets.chomp
	break if !second_num.to_i.zero?
	prompt("Choose num other than zero")
end



operations = {
	'+': (first_num.to_i + second_num.to_i), 
	'-': (first_num.to_i - second_num.to_i), 
	'*': (first_num.to_i * second_num.to_i), 
	'/': (first_num.to_f / second_num.to_f), 
	'%': (first_num.to_i % second_num.to_i), 
	'**': (first_num.to_i**second_num.to_i)}

operations.each do |op, function|
	prompt "#{first_num} #{op} #{second_num} = #{function}"
end

operations_float = {
	'+': (first_num.to_f + second_num.to_f), 
	'-': (first_num.to_f - second_num.to_f), 
	'*': (first_num.to_f * second_num.to_f), 
	'/': (first_num.to_f / second_num.to_f), 
	'%': (first_num.to_f % second_num.to_f), 
	'**': (first_num.to_f**second_num.to_f)}

