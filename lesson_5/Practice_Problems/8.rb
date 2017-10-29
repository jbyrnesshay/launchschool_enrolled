#Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


# method 1
vowels = ''
hsh.each do |k,v|
  vowels << v.join.scan(/[aeiouAEIOU]/).join
end
puts vowels

#method 2
selected_chars = ''
vowels = 'aeiouAEIOU'
hsh.each_value do |values|
  letters = values.join.split('').select do |char|
    vowels.include?(char)
  end
  selected_chars << letters.join
end
puts selected_chars

#method 3
vowels = 'aeiouAEIOU'
list = ''
hsh.each do |k,v|
  string = v.join
  string.chars.each do |char|
    list << char if vowels.include?(char)
  end
end
puts list

#method 4
vowels = 'aeiouAEIOU'
list = ''
hsh.each do |k,v|
  v.join.chars.each do |char|
    list << char if vowels.include?(char)
  end
end
puts list