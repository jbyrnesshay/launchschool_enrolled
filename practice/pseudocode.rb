
=begin
# problem: define a method that returns the sum of 2 integers

given two integers
save the value of the sum of the 2 integers
return the saved value

START

SET first_num = 4
SET second_num = 6
SET sum = first_num + second_num

PRINT sum

END

#problem: define a method that takes an array of strings, and returns
a string that is all those strings concatenated together

given an array of strings called "strings"
define a variable to store the concatenation
iterate through the array, while
saving the first element to the concat variable
then each successive element
return the saved concatenation value

START
SET concatenated = an empty string
SET iterator = 0

WHILE iterator < length of strings
  concatanated = concatanated plus value within
    strings collection at space "iterator"
  iterator = iterator + 1
PRINT concatenated
END
 
strings = %w[dog cat fish bird scott bill matt]
concatenated = ''
strings.each { |string| concatenated += string }
puts concatenated

#problem: define a method that takes an array of
#integers and returns a new array with every other element

given an array of integers called "numbers"
define an empty array to store the new array
iterate through the array in steps of 2, assigning current value to new array
return new array

SET iterator = 1
SEt new_array = []
WHILE iterator < length of numbers
  new_array = new_array + value within numbers collection at space iterator
  iterator = iterator + 2
PRINT new_array

END
=end
numbers = [4, 3, 5, 9, 11, 15]
new_array = []
numbers.each_with_index do |value, index|
  next if index.even?
  new_array << value
end
puts new_array
