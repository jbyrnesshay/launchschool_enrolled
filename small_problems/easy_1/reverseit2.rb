=begin
 
Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.
=end
 

def reverse_words(string)
  words = string.split()
  words.map! do |word|
    if word.length >= 5
      word.reverse
    else word
    end
  end
  words.join(' ')
end

puts reverse_words("Professional times for cats and dogs but not for dingos")