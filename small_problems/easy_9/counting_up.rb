
=begin
Write a method that takes an integer argument, 
and returns an Array of all integers, in sequence, b
etween 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.
=end


def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1) 


#alternate
def sequence2(num)
  (1..num).each_with_object([]) {|i, array| array << i}
end
p sequence2(5) == [1, 2, 3, 4, 5]
p sequence2(3) == [1, 2, 3]
p sequence2(1) == [1]
p sequence2(-1) 

#alternate2, to take account of negative and zero vals
def sequence3(num)
  case 
   when num.positive? then (1..num).to_a
   else (num..1).to_a.reverse
  end
end
p sequence3(-1) 
p sequence3(-7) 
p sequence3(5) 
p sequence3(0) 

#alternate3, return nil on neg or 0
def sequence4(num)
  num.positive? ? (1..num).to_a : nil
end

p sequence4(-1) 
p sequence4(-7) 
p sequence4(5) 
p sequence4(0) 