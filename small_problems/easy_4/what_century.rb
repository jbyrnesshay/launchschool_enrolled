

def century(year)
  check_if_new = (year % 100 > 0)? 1 : 0
  century = (year / 100) + check_if_new
  suffix = if century % 100 / 10 == 1 
    'th'
    #every 10 + x is a 'th', i.e. 11th, 12th 13th, 14th, vs _1st, _2nd, 3rd
  elsif century % 10 == 1  
    'st'
  elsif century % 10 == 2  
    'nd'
  elsif century % 10 == 3  
    'rd'
  else
    'th'
  end
  century.to_s + suffix
end


puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
#not accounting for 11 vs 101 vs 21
puts century(1127) == '12th'
#not accounting for 12 as special case, ala 11
puts century(11201) == '113th'