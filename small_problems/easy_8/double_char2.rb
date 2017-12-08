



def double_consonants(string)
  new_str = ''
  string.each_char {|char| new_str << ((/[^aeiou\W\d]/ =~ char) ? char * 2 : char) }
  new_str
end






p double_consonants('String') #== "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""


#alternate (just cleaned)
def double_consonants(string)
  new_str = ''
  string.each_char do |char|
    if /[^aeiou\W\d]/ =~ char
     new_str << char * 2
    else  char
    end
  end
  new_str
end



#alternate
def double_consonants3(string)
  # ^% matches in case of empty string, to handle that gsub! returns nil when no match, 
  # i.e. an input of empty string would retun nil instead of '', if not for this case handling
  string.gsub!(/^$|[^aeiou\W\d]/i) { |match| match * 2 }
end
 
p double_consonants3('String') == "SSttrrinngg"
p double_consonants3("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants3("July 4th") == "JJullyy 4tthh"
p double_consonants3('') == ""


#alternate the long way
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
def double_consonants5(string)
  doubled_cons = ''
   string.each_char do |char|
    doubled_cons << char 
    doubled_cons << char if CONSONANTS.include?(char.downcase)
   end
   doubled_cons
end
 
p double_consonants5('String') == "SSttrrinngg"
p double_consonants5("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants5("July 4th") == "JJullyy 4tthh"
p double_consonants5('') == ""