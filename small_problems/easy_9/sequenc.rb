

=begin
  
 
eate a method that takes two integers as arguments. The first argument is a count, 
and the second is the first number of a sequence that your method will create. 
The method should return an Array that contains the same number of elements as the count
argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, 
while the starting number can be any integer value. If the count is 0, an empty list should be returned.

Examples:
=end


def sequence(count, first_num)
  array = []
  (1..count).each do |i|
    array << first_num * i
  end
  array
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []


#alternate
def sequence2(count, first_num)
  (1..count).each_with_object([]) {|i, array| array << first_num * i}
end

p sequence2(5, 1) == [1, 2, 3, 4, 5]
p sequence2(4, -7) == [-7, -14, -21, -28]
p sequence2(3, 0) == [0, 0, 0]
p sequence2(0, 1000000) == []

#alternate

def sequence3(count, first_num)
  (1..count).map {|i| first_num * i}
end

p sequence3(5, 1) == [1, 2, 3, 4, 5]
p sequence3(4, -7) == [-7, -14, -21, -28]
p sequence3(3, 0) == [0, 0, 0]
p sequence3(0, 1000000) == []