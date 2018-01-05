=begin

Write a method that takes a string as an argument and returns a new string 
in which every uppercase letter is replaced by its lowercase version, 
and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method

=end


def swapcase(string)
  string.each_char.map { |char| char.match(/[A-Z]/) ? char.downcase : char.match(/[a-z]/) ? char.upcase : char }.join
end
p swapcase('CamelCase') 
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'



#alternate

def swapcase2(string)
  string.each_char.with_index do |char, i|
    if char.downcase == char 
      string[i] = char.upcase
    elsif char.upcase == char 
      string[i] = char.downcase
    end
  end
  string
end

p swapcase2('CamelCase') 
p swapcase2('CamelCase') == 'cAMELcASE'
p swapcase2('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'



