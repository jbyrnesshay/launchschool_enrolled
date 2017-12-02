

=begin
\Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.
=end


def penultimate(string)
 # string.match(/\w+(?=\s\w+[^A-Aa-z]*$)/)
   string.match(/\S+(?=\s\S+$)/)
end

p penultimate('last word')
p penultimate('Launch School is great!')

 
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

def penultimate2(string)
   string.split[-2]
end

p penultimate2('last word')
p penultimate2('Launch School is great!')
#penultimate2('last word') == 'last'
#penultimate2('Launch School is great!') == 'is'

 
 def penultimate3(string)
  string.split[string.split.size - 2]
end

p penultimate3('last word')
p penultimate3('Launch School is great!')


def middle_word(string)

  words = string.split
  if words.size.odd?
    words[words.size % (words.size/2 + 1)]
  elsif words.size.even? && !words.empty?
    'there is no middle word, you have an even number of words'
  else 
    nil
  end
end
puts;puts;

p middle_word('what a great day guys')
p middle_word('whose end is most near?')
p middle_word('')
p middle_word('one thing')
p middle_word('haha')