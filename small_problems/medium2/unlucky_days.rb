=begin
Write a method that returns the number 
of Friday the 13ths in the year 
given by an argument. 
You may assume that the year 
is greater than 1752 
(when the United Kingdom 
  adopted the modern Gregorian Calendar) 
and that it will remain in use 
for the foreseeable future.
=end
def friday_13th(year)
  count = 0
  1.upto(12) do |month|
    t = Time.new(year, month, 13)
    count += 1 if t.friday?
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2


# alternative
require 'date'
def friday_13th2(year)
  count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do 
    count += 1 if thirtheenth.friday?
    thirteenth = thirteenth.next_month
  end
  count
end