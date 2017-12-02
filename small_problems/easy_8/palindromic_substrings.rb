
=begin
Write a method that returns a list of all substrings of
 a string that are palindromic. That is, each substring must 
 consist of the same sequence of characters forwards as it does backwards. 
 The return value should be arranged in the same sequence as the substrings appear 
 in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention 
to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. 
  In addition, assume that single characters are not palindromes.
=end
 


def substrings_at_start(string)
  new_arry = []
  1.upto(string.size) do |p|
    new_arry << string.slice(0,p)
  end
  new_arry
end



def substrings(string)
  array = []
  0.upto(string.size - 1) do |n|
    substr = string.slice(n..-1)
    array += substrings_at_start(substr)
  end
  array
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings('abcde')


def substrings2(string)
  results = []
  (0..string.size).each do |n|
    substr = string[n..-1]
    results.concat(substrings_at_start(substr))
  end
  results
end
  
  p substrings2('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings2('abcde')


def palindromes(string)
  substrings(string).select { |item| item.size > 1 && item == item.reverse }
end

p palindromes('hello-madam-did-madam-goodbye') 
p palindromes('madam') 
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
