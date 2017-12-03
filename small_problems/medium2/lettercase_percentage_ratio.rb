
=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: 
one represents the percentage of characters in the string that are lowercase letters, 
one the percentage of characters that are uppercase letters, and 
one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples
=end




def letter_percentages(string)
  upperc_percent = (string.count('A-Z') / string.size.to_f * 100).divmod(1).sum
  lowerc_percent = (string.count('a-z') / string.size.to_f * 100).divmod(1).sum
  other_percent = (string.count('^A-Za-z') / string.size.to_f * 100).divmod(1).sum
{lowercase: lowerc_percent, uppercase: upperc_percent, neither: other_percent }
end

#count_to_percent
p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }