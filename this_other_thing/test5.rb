


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

words.each do |word|
  array = []
  words.each do |word2|
    array << word2 if word.chars.sort == word2.chars.sort
  end
   puts array.inspect
end


# alternative, with hash
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


result = {}
words.each do |word|
  key = word.split('').sort.join
  # p key
  if result.key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end


p result
