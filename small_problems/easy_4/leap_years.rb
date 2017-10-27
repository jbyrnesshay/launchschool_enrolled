def julian_leap_year?(year)
  even_divisible?(year, 4)
end

def leap_year?(year)
  return julian_leap_year?(year) if year < 1752
  even_divisible?(year, 400) ||
    (even_divisible?(year, 4) && !even_divisible?(year, 100))
end

def even_divisible?(year, num)
  (year % num).zero?
end

def display_leap_status(year)
  puts "leap_year?(#{year} == #{leap_year?(year)})"
end

display_leap_status(2016)
display_leap_status(2015)
display_leap_status(2100)

display_leap_status(2400)
display_leap_status(240000)
display_leap_status(240001)

display_leap_status(2000)
display_leap_status(1900)
display_leap_status(1752)

display_leap_status(1700)
display_leap_status(1)
display_leap_status(100)

display_leap_status(400)
 
=begin
further exploration
class solution will fail for year 2000, 2400, anything where year % 400 == 0
=end
def display_leap_status2(year)
  #puts "leap_year2?(#{year} == #{leap_year2?(year)})"
end

def leap_year2?(year)
  is_it_leap_year = if even_divisible?(year, 4)
                      return false if even_divisible?(year, 100) && !even_divisible?(year, 400)
                      true
                    else false
                    end
  is_it_leap_year
end
puts 'try with further exploration'
display_leap_status2(2016)
display_leap_status2(2015)
display_leap_status2(2100)

display_leap_status2(2400)
display_leap_status2(240000)
display_leap_status2(240001)

display_leap_status2(2000)
display_leap_status2(1900)
display_leap_status2(1752)

display_leap_status2(1700)
display_leap_status2(1)
display_leap_status2(100)

display_leap_status2(400)


