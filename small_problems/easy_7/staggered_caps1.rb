
=begin
Write a method that takes a String as an argument, 
and returns a new String that contains the original
 value using a staggered capitalization scheme in 
 which every other character is capitalized, and 
 the remaining characters are lowercase. Characters that are not 
 letters should not be changed, but count as characters when 
 switching between upper and lowercase.

=end
 def staggered_case(string)
  string.each_char.with_index do |char, i|
    if i.even? 
      string[i] = char.upcase
    elsif i.odd?
      string[i] = char.downcase
    end
  end
  string
end

p staggered_case('I Love Launch School!') 

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

 

#alternate
def staggered_case2(string, need_upper: true)
  result = ''
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case2('I Love Launch School!') 

p staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS') == 'AlL_CaPs'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
