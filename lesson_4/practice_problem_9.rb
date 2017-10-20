words = "the flintstones rock"

def titleize(words)
  words = words.split
  words.map! do |word|
    word.capitalize!
  end
  words.join(' ')
end

#words = titleize(words)

#puts words
words = "the flintstones rock"
#in other words
words = words.split.map {|word| word.capitalize}.join(' ')

puts words