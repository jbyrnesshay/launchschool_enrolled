
#Leading Substrings

#Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.




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