def palindromic_number?(num)
	num.to_s == num.to_s.reverse
end


puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(345432) == true
puts palindromic_number?(123210) == true

def palindrome?(string)
	string == string.reverse
end

puts
def palindromic_number?(num)
	#puts '0d'num.to_s
    #if num.to_s != num.to_s(8)
		#num2 = num.to_s(8)
	#end
	if num.to_s(8).to_i != num
		num3 = num.to_s(8)
	else num3 = num
	end
	num = num.to_i
	num1 = num.to_s
	num2 = num.to_s(8)
	puts num3
	#puts num2

	palindrome?(num.to_s)
end	

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(345432) == true
puts palindromic_number?(123210) == true
puts palindromic_number?(00122100) == true