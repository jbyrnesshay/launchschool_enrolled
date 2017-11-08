#Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


vowels = 'aeiouAEIOU'
result = []
hsh.each do |key, values|
	letters = values.join.split('')
	letters.each do |letter|
		if vowels.include?(letter)
			result << letter
		end
	end
end

p result

#alternate

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
result2 = []
hsh.each do |key, values|
	letters = values.join.split('')
	matches = letters.join.scan(/[aeiouAEIOU]/)
	result2 += matches

end
p result2

#alternate
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
chars = hsh.values.join.chars
matches = []
exp = (/[aeiouAEIOU]/)
chars.each do |char|
	if char =~ exp
		matches << char
	end
end
p matches
