
=begin
    the loan amount
    the Annual Percentage Rate (APR)
    the loan duration

From the above, you'll need to calculate the following two things:

    monthly interest rate
    loan duration in months
m = p * (j / (1 - (1 + j)**(-n)))
    m = monthly payment
    p = loan amount
    j = monthly interest rate
    n = loan duration in months
=end

loan_amount = ''
a_p_r = ''
loan_duration = ''

def monthly_payment(amt, rate, dur)
  dur = dur.to_f * 12
  rate = (rate.to_f / 100) / 12
  payment = amt.to_f * (rate / (1 - (1 + rate)**-dur))
  payment.round(2)
end

def valid_num?(num)
  float?(num) || integer?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def prompt(message)
  puts "=> #{message}"
end

def clear_terminal
  system('cls')
  system('clear')
end

loop do
  clear_terminal
  puts
  puts <<-MSG
  *************************************************************
  ***** Welcome to Loan Calculator ****************************
  ***** Find out your monthly payment for your loan terms *****
  *************************************************************
  MSG
  puts
  loop do
    prompt "Please enter your requested loan amount"
    loan_amount = gets.chomp
    break if valid_num?(loan_amount)
    prompt "Sorry that is not a valid number"
  end

  loop do
    prompt "Please enter the APR:"
    a_p_r = gets.chomp
    break if valid_num?(a_p_r)
    prompt "Sorry that is not a valid number"
  end

  loop do
    prompt "Please enter requested loan duration"
    prompt "in years (ex: 5, or 5.4)"
    loan_duration = gets.chomp
    break if valid_num?(loan_duration)
    prompt "Sorry that is not a valid number"
  end
  monthly_pay = monthly_payment(loan_amount, a_p_r, loan_duration)
  clear_terminal
  puts
  puts "********************************************"
  puts "***Results of your loan information request*"
  puts "********************************************"
  puts
  puts "Your monthly payment is: "
  puts
  prompt "$#{monthly_pay.to_f}"
  puts
  puts "********************************************"
  puts
  prompt "Here is a review of your overall loan terms:"
  prompt "You requested a loan of $#{loan_amount}"
  prompt "You requested a loan duration #{loan_duration} years"
  prompt "Your APR is #{a_p_r}%"
  prompt "Your monthly payment is $#{monthly_pay}"
  puts
  puts "********************************************"
  prompt 'Do you want to calculate another loan (y or n)?'
  continue = gets.chomp
  break if continue.downcase == 'n'
end
prompt "Thank you for using Loan Calculator"
