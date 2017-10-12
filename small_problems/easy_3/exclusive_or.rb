
def xor?(test1, test2)
  !(test1 && test2) && (test1 || test2)  
  #or
  #(test1 && !test2) || (test2 && !test1)
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
puts xor?(10.even?, 16.even?) == true


def xor2?(test1, test2)
  return true if test1 && !test2
  return true if test2 && !test1
  #false
end

puts
puts xor2?(5.even?, 4.even?) == true
puts xor2?(5.odd?, 4.odd?) == true
puts xor2?(5.odd?, 4.even?) == false
puts xor2?(5.even?, 4.odd?) == false
puts xor2?(10.even?, 16.even?) == true