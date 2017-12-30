=begin
  


Write a method that takes a sentence string as input, 
and returns the same string with any sequence of the words 
'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:
=end


def word_to_digit(string)
  digits = {'zero'=>0, 'one'=>1, 'two'=>2, 'three'=>3, 'four'=>4, 'five'=>5, 'six'=>6, 'seven'=>7, 'eight'=>8, 'nine'=>9}.freeze
  #words = string.scan(/\w+/)
  digits.keys.each do |key|
    string.gsub!(/\b#{key}\b/i, digits[key].to_s)
  end
  x = string.scan(/(\d\s*)/)
  puts x.join
  
  string
end


p word_to_digit('Freight.  Please two three four.  call me at five five five One two THREE four. Thanks.')# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


#alternate
 