=begin
ddaaiillyy ddoouubbllee

Write a method that takes a string argument and returns a new string 
that contains the value of the original string with all consecutive duplicate characters 
collapsed into a single character. You may not use String#squeeze or String#squeeze!.

Examples:

c
=end

def crunch(string)
  crunch_text = ''
  string.chars.each_with_index do |char, x|
    crunch_text << char unless char == string[x+1]

  end
 crunch_text
 
 
end
crunch('ddaaiillyy ddoouubbllee')
crunch('4444abcabccba') 

def reg(string)
  crunch_text = ''
  chars = string.chars
  p reduce = string.match(/(\w{1,})\1+/)
  p reduce.captures

end

p reg('ddaaaiillyy dd1oouubbllee')
p reg('4444abcabccba') 
 
def crunch4(text)
  index = 0
  crunch_text = ""
  while index <= (text.length - 1)
    # i forgot that index out of range will return nil and not return an error
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end

  crunch_text
end
#p crunch4('ddaaaiillyy ddoouubbllee') == 'daily double'
#p crunch4('4444abcabccba') == '4abcabcba'