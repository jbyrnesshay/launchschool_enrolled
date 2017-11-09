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

def display_leap_status2(year)
  puts "leap_year?(#{year} == #{leap_year?(year)})"
end


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