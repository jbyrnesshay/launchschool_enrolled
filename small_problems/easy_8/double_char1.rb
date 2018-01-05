


# doesn't work because I am changing the size (index range) within the block
=begin
def repeater(string)
   chars = string.chars
    
   chars.each_with_index do |x, y|
   p y + 1
   p x
   string =  string.insert(y+1, x)
   p string
   end
   string
end
=end
 
def repeater(string)
  string.chars.map {|x| x * 2}.join
end

 

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''



# alternative version
def repeater2(string)
  repeated = ""
  string.each_char {|char| repeated << char * 2}
  repeated
end


p repeater2('Hello') == "HHeelllloo"
p repeater2("Good job!") == "GGoooodd  jjoobb!!"
p repeater2('') == ''