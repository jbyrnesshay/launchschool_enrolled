=begin
Write a method that returns a list of all substrings of a string that are palindromic. 
That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
The return value should be arranged in the same sequence as the substrings appear in the string. 
Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, 
  "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes
=end







def palindromes(string, ignore = false)
  
  all_substrings(string).select do |sub|
    check_string = ignore ? sub.delete('^a-zA-Z').downcase : sub 
    #check_string.size > 1 && check_string.reverse == check_string
    sub.size > 1 && sub.delete('^a-zA-Z').reverse ==  sub.delete('^a-zA-Z')
  end
end

def substrings_start(string, ignore = false)
  result = []
  1.upto(string.size) do |x|
    result << string.slice(0, x)
  end
  result
end

def all_substrings(string, ignore = false)
  result = []
  0.upto(string.size - 1) do |y|
    result += substrings_start(string.slice(y..-1))
  end
  result 
end

substrings_start('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde']


all_substrings('abcde') == [
 'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('he7llo-mada8m-did-madam-goOdbye') #== [

 # 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
 # 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#  '-madam-', 'madam', 'ada', 'oo'
#]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
 