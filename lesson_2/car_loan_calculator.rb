=begin
Take everything you've learned so far and build a mortgage calculator (or car payment calculator -- it's the same thing).

You'll need three pieces of information:

    the loan amount
    the Annual Percentage Rate (APR)
    the loan duration

From the above, you'll need to calculate the following two things:

    monthly interest rate
    loan duration in months

You can use the following formula:

Mortgage Calculator Formula

Translated to Ruby, this is what the formula looks like:

m = p * (j / (1 - (1 + j)**(-n)))

    m = monthly payment
    p = loan amount
    j = monthly interest rate
    n = loan duration in months
=end

=begin
given the following information:  loan amount to be repaid, loan duration(years), and APR
monthly interest rate is APR / 12
loan duration in months is loan duration(years) * 12
calculate monthly payment using provided formula
=end
=begin
  
START
inputs:
GET user input as loan amount
validate as integer or float
SET loan_amount = (user input) 
GET user input as loan in years
validate as integer or float
SET loan_years = (user input)
GET user input as APR
validate as integer or float
SET APR = (user input)


SET monthly_int_rate = APR / 12
SET loan_months = loan_years * 12

SET monthly_payment = loan_amount * ( monthly_int_rate / (1 - (1 + monthly_int_rate)**(-loan_months) ))

PRINT monthly_payment
=end

def valid_num?(num)
  float?(num) || integer?(num) || rational?(num)
end
def float?(num)
  num.to_f.to_s == num
end
def integer?(num)
  num.to_i.to_s == num
end
def fraction?(num)
  #num.to_r.to_s == num
  
  num.match(/\d+\/\d+/)
end
def rational?(num)
  first_num, second_num, garbage = num.split()
  if garbage
    false
  elsif fraction?(first_num) && !second_num
    true
  elsif integer?(first_num) && (second_num && fraction?(second_num))
    true
  else false
  end
end
def monthly_payment(years, amount, rate)
  month_rate = (rate.to_f / 100) / 12
  loan_months = years.to_f * 12
  puts
  puts "rate is #{month_rate}"
  puts "months are #{loan_months}"
  puts "amount is #{amount.to_f}"
  p = amount.to_f
  j = month_rate.to_f
  n = loan_months.to_f
  #amount.to_f * (month_rate / (1 - (1 + month_rate)**(-loan_months)))
  m = p * (j / (1 - (1 + j)**(-n)))
  #[p,j,n]
end
=begin
  
m = p * (j / (1 - (1 + j)**(-n)))

    m = monthly payment
    p = loan amount
    j = monthly interest rate
    n = loan duration in months
=end 
  
 
loan_amount, loan_years, APR = '','',''
loop do 
  puts "enter loan amount: "
  loan_amount = gets.chomp
  break if valid_num?(loan_amount)
  puts "sorry. that is not a valid number for loan amount"
end

loop do
  puts "enter loan length in years"
  loan_years = gets.chomp
  break if valid_num?(loan_years)
  puts "sorry. that is not a valid number for loan length"
end

loop do 
  puts "enter APR: "
  APR = gets.chomp
  break if valid_num?(APR)
  puts "sorry. that is not a valid APR"
end
payment = monthly_payment(loan_years, loan_amount, APR)

puts "you want a loan of $#{loan_amount}"
puts "this is to be paid over #{loan_years} years"
puts "your APR is #{APR}"
puts
puts "given this information, your monthly payment is: "
puts
puts "$#{payment}"