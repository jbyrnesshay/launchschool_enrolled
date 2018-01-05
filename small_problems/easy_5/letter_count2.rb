
def word_sizes(string)
  words = string.split
  count_sizes = Hash.new(0)
   

  words.each do |word|
    wo_nonalpha = 0
    word.chars do |char|

      wo_nonalpha += 1 if char.match(/[a-z]/i)
    end
    count_sizes[wo_nonalpha] += 1

  end
  p count_sizes
  count_sizes
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}


def take2(string)
  words = string.split
  count_sizes = Hash.new(0)

  words.each do |word|
    clean_word = word.delete('^A-Za-z') 
    count_sizes[clean_word.size] += 1
  end
  count_sizes
end

p take2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p take2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p take2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p take2('') == {}