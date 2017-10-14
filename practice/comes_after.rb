def comes_after(str, letter)
  target = letter
  words = str.split(' ')
  found_word = []

  words.each do |word|
    if word.index(target)
      saved_index = word.index(target)
      found_word.push(word[saved_index + 1])
    end
  end
  found_word
end

puts comes_after('Pirates say arrrrrr.', 'r').inspect
