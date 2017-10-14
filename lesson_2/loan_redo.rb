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

loop do
  prompt "Welcome to Loan Calculator"

  loop do
    prompt "Please enter your requested loan amount:"
    loan_amount = gets.chomp
    break if valid_num?(loan_amount)
    prompt "sorry that is not a valid number"
  end

  loop do
    prompt "Please enter the APR:"
    a_p_r = gets.chomp
    break if valid_num?(a_p_r)
    prompt "sorry that is not a valid number"
  end

  loop do
    prompt "Please enter requested loan duration in years (ex: 5, or 5.4)"
    loan_duration = gets.chomp
    break if valid_num?(loan_duration)
    prompt "sorry that is not a valid number"
  end
  monthly_pay = monthly_payment(loan_amount, a_p_r, loan_duration)
  prompt "your monthly payment is $#{monthly_pay}"
  prompt 'do you want to calculate another loan (y or n)?'
  continue = gets.chomp
  break if continue.downcase == 'n'
end
prompt "thank you for using Loan Calculator"
