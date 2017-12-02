

#Write a method that takes a string, and then returns a hash that contains 3 entries: 
#one represents the number of characters in the string that are lowercase letters, 
#one the number of characters that are uppercase letters, and one the number of characters that are neither.




def letter_case_count(string)
  counts = {lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    case 
      when char.match(/[a-z]/) then counts[:lowercase] += 1
      when char.match(/[A-Z]/) then counts[:uppercase] += 1
      else counts[:neither] += 1
    end 
  end
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }



#alternate2
def letter_case_count2(string)
  counts = {}
  counts[:lowercase] = string.count('a-z')
  counts[:uppercase] = string.count('A-Z')
  counts[:neither] = string.count('^A-Za-z')
  counts
end
puts "try 2"
p letter_case_count2('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count2('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count2('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count2('') == { lowercase: 0, uppercase: 0, neither: 0 }
 