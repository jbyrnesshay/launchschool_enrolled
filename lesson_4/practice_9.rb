words = "the flintstones rock"

def titleize(string)
  words = string.split
  words.each do |word|
    word[0] = word[0].upcase
  end
  words.join(' ')
end

#uts titleize(words)



def redo_tit(string)
  words = string.split
  words.map! {|word| word.capitalize}
  words.join(' ')
end

puts redo_tit(words)

