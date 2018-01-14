=begin
count the number months 
that have five Fridays. 
This one is harder than it 
sounds since you must account 
for leap years.

=end


require 'date'
def five_fridays(year)
  #leap year is every year exactly divisible by 4
  #except where also divisible by 100 (but is leap if exactly divislbe by 400)
  with_5_fridays = 0
  date = Date.new(year)
  12.times do |month|
    with_5_fridays += 1 if count_5_fridays(date)
    date = date.next_month
  end
  with_5_fridays
end


def count_5_fridays(date)
  fridays = 0
  loop do  
    fridays += 1 if date.friday?
    break if date.mon != date.next_day.mon
    date = date.next_day
  end
  fridays == 5
end


p five_fridays(1988)