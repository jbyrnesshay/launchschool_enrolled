def swap_first_last_characters(a,b)
  a,b = b,a
end
                            theword
word = 'baddy'

 p word[0].object_id
 p word[1].object_id
  swap_first_last_characters(word[0], word[-1])
 

p word


=begin
#does not work because a and b are strings, assigned to the values of string.slice calls
1. a and b are the callers, and they are copies of word[0],word[-1] 
   a = word[0]
    b = word[1]
    a = b
    b = a
=end