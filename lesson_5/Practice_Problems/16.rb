
=begin
 A UUID is a type of identifier often used as a way 
 to uniquely identify items...which may not
  all be created by the same system. That is, 
  without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. 
The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, 
and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.
=end


def create_hex
  hex = ''
  nums = '0123456789abcdef'
  32.times do 
     #rand = nums.chars.sample
     hex << rand(0..16).to_s(16)
     #hex << rand
  end
  #puts hex.size 
  hex
end

def parse_hex(hex)
  new_hex = ''
  slices = [[0,8], [8,4], [12,4],[16,4], [20, 12]]
  slices.each_with_index do |sliver, index|
    conjunctor = index < (slices.size - 1) ? '-' : ''
    new_hex << hex.slice(sliver.first, sliver.last) + conjunctor
  end
  #new_hex.slice!(36,1)
  new_hex
end

def uuid
  hex = create_hex
 parse_hex(hex)
end

puts uuid

