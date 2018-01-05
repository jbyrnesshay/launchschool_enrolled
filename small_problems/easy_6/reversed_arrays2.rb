

=begin

Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.
=end




def reverse(array)
  new_array = []
  copy = array.dup
  array.each do |x|
    new_array << copy.pop
  end
  new_array
end


p reverse([1,2,3,4])
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true


def reverse_alt(array)
  new_array = []
  (array.size).times { |x| new_array << array[array.size - 1 - x] }
  new_array
end

p reverse_alt([1,2,3,4])
p reverse_alt([1,2,3,4]) == [4,3,2,1]          # => true
p reverse_alt(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse_alt(['abc']) == ['abc']              # => true
p reverse_alt([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse_alt(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true

def reversa(array)
  array.inject([]) { |sum, x| sum.unshift(x) }
end
p 'o'
p reversa([1,2,3,4])
p reversa([1,2,3,4]) == [4,3,2,1]          # => true
p reversa(%w(a b c d e)) == %w(e d c b a)  # => true
p reversa(['abc']) == ['abc']              # => true
p reversa([]) == []                        # => true
list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reversa(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
def reverta(array)
  array.each_with_object([]) {|val,new_array| new_array.unshift(val)}
end
p reverta([1,2,3,4])
p reverta([1,2,3,4]) == [4,3,2,1]          # => true
p reverta(%w(a b c d e)) == %w(e d c b a)  # => true
p reverta(['abc']) == ['abc']              # => true
p reverta([]) == []                        # => true

def reverga(array)
  array.reduce([], :<<array[2])
end
p reverga([1,2,3,4])
p reverga([1,2,3,4]) == [4,3,2,1]          # => true
p reverga(%w(a b c d e)) == %w(e d c b a)  # => true
p reverga(['abc']) == ['abc']              # => true
p reverga([]) == []                        # => true
list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverga(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true