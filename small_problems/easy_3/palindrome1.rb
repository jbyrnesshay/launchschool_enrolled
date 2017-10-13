
def palindrome?(string)
	original = string.split('')
	new = []
	#puts original.inspect
	while !original.empty?
		new << original.pop
	end
	string == new.join
end


puts palindrome?("thing") == false
puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true


def palindrome2?(string)
	string == string.reverse
end
puts
puts palindrome2?("thing") == false
puts palindrome2?('madam') == true
puts palindrome2?('Madam') == false          # (case matters)
puts palindrome2?("madam i'm adam") == false # (all characters matter)
puts palindrome2?('356653') == true

#further exploration

def palindromic_object(object)
	#array or string, no irf, unless, or case
	object == object.reverse
end
puts
puts "object"
puts palindromic_object(['m', 'a', 'd', 'a', 'm']) == true
puts palindromic_object(['u', 'n', 'i', 'v', 'e', 'r', 's', 'i', 't', 'y']) == false
puts palindromic_object("356653") == true
puts palindromic_object("bigshot school") == false