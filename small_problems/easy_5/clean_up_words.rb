require 'pry'
=begin
Clean up the words

Given a string that consists of some words and an assortment of non-alphabetic characters, 
write a method that returns that string with all of the non-alphabetic characters
 replaced by spaces. If one or more non-alphabetic characters occur in a row, 
 you should only have one space in the result (the result should never have
  consecutive spaces).

Examples:

cleanup("---what's my +*& line?") == ' what s my line '
=end


def cleanup(string)
  string.gsub!(/\W+/, ' ')
end

#p cleanup("---what's my +*& line?") == ' what s my line '

def cleanup2(string)
  string.gsub(/[^a-z]/i, ' ').squeeze
end
#/i ignore case
#p cleanup2("---what's my +*& line?") == ' what s my line '


def cleanup_noreg(string)
    blocks = string.split
    result = blocks.map do |word|
       word = word.chars.map! do |char|
        if char.downcase == char.downcase.upcase
          ' '
        else   
          char
        end
      end
     word = word.join
    # p word
    #p word.squeeze(" ")
     #word.squeeze(" ")
     # take note that here +*& is a block or word, and gets replaced by a space without
     # any contiguous letter chars
     # so after join on line 48, there are 3 spaces between my and line, without the squeeze call
     word
    end
    result = result.join(' ').squeeze(' ')#.squeeze
end

 

p cleanup_noreg("---what's my +*& line?") 
p cleanup("---what's my +*& line?") == ' what s my line '