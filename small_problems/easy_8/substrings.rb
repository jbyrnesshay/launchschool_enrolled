
#Leading Substrings

#Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.




def substrings_at_start(string)
  new_arry = []
  1.upto(string.size) do |p|
    new_arry << string.slice(0,p)
  end
  new_arry
end


p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
