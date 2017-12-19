=begin
Write a method that takes a string argument, 
and returns true if all of the alphabetic characters 
inside the string are uppercase, false otherwise. 
Characters that are not alphabetic should be ignored.
=end



def uppercase?(string)
  string.upcase == string
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true


# strig is empty?
def uppercase2?(string)
  string.empty? ? false : string.upcase == string 
end

p uppercase2?('FOUR SCORE') == true
p uppercase2?('4SCORE!') == true
p uppercase2?('') == false
p uppercase2?('!*') == false
#w_ does it make sense to rturn false if string is empty?
# "if all the alphabetic characters inside the string are uppercase"
# the name of the method suggests a test for uppercase lett(ers (all)
# therefore it makes sense that a strig lacking uppercase letters returns false

# so rewrite
def uppercase3?(string)
  #p string.scan(/[a-z]/i)
  !string.scan(/[A-Z]/).empty? && string.scan(/[A-Z]/) == string.scan(/[a-z]/i)
end
puts 'test'
puts
p uppercase3?('FOUR SCORE') #== true
p uppercase3?('4SCORE!') #== true
p uppercase3?('i Donna like')
p uppercase3?('') #== true
p uppercase3?('!*') #== false

def uppercase4?(string)
  #string.upcase == string for all alpha letters matching uppercase
  # string.upcase == string.downcase would entail either string is completely empty string or symbols or numbers
   string.upcase == string && !(string.upcase == string.downcase)
end
puts 
puts
p uppercase4?('FOUR SCORE') == true
p uppercase4?('4SCORE!') == true
p uppercase4?('i Donna like') == false
p uppercase4?('') == false
p uppercase4?('!*') == false
p uppercase4?('452') == false
