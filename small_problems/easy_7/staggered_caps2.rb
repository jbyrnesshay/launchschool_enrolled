
=begin
Write a method that takes a String as an argument, 
and returns a new String that contains the original
 value using a staggered capitalization scheme in 
 which every other character is capitalized, and 
 the remaining characters are lowercase. Characters that are not 
 letters should not be changed, but count as characters when 
 switching between upper and lowercase.

=end
 
#alternate
def staggered_case2(string, need_upper: true)
  result = ''
  string.chars.each do |char|
    if char.match(/[^A-Za-z]/)
      result += char
      next
    elsif need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end
p staggered_case2('I Love Launch School!')
p staggered_case2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS') == 'AlL cApS'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
 

#alternate
def staggered_case3(string, need_upper: true, count_nonalpha: true)
  result = ''
  string.chars.each do |char|
    if char =~ /[A-Z]/i # ignore case
      if need_upper
        result += char.upcase
      else 
        result += char.downcase
      end
       need_upper = !need_upper
    else 
      
      result += char 
      need_upper = !need_upper if count_nonalpha == true
    end
   
  end
  result
end

p staggered_case3('I Love Launch School!')
p staggered_case3('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'

p staggered_case3('ALL CAPS') == 'AlL cApS'
p staggered_case3('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
