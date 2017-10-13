def palindrome?(string)
	string == string.reverse
end
=begin
def real_palindrome?(string)
	string.downcase! 
	string = string.scan(/\w/)
	#puts string.inspect
	palindrome?(string)
end
=end
def real_palindrome?(string)
	#string = string.downcase.delete('^a-zA-Z0-9')
	string = string.downcase.gsub(/[^a-zA-Z0-9]/, '')
	# vs
	#string = string.gsub(/a-zA-Z0-9/, 'g')
	# vs
	puts string
	palindrome?(string)
end
puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false