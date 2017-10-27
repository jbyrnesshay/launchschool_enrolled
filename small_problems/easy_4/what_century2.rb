
test = ARGV[0].to_i

def century(year)
  century = (year / 100) + (year % 10 > 0 ? 1 : 0)
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  values = { 1 => 'st', 2 => 'nd', 3 => 'rd' }
  teens = century % 100 / 10 == 1
  ending = if (1..3).cover?(century % 10) && !teens
             values[century % 10]
           else 'th'
           end
  ending
end

puts century(test)
=begin
  ending = if century % 10 == 1 && !teens
             'st'
           elsif century % 10 == 2 && !teens
             'nd'
           elsif century % 10 == 3 && !teens
             'rd'
           else 'th'
           end
=end
=begin
  st, nd, rd, th
  century
st =>
1st, 21st, 31st, 101st
not 11th, not 211th
not when century % 100 / 10 > 1
when century % 10 == 1
when century % 100 / 10== 1
nd =>
2nd, 102nd, 42nd, 522nd
not when centry % 100 / 10 == 1
rd =>
3rd, 23rd, 153rd
th =>
20th, 11th, 12th, 113th


=end