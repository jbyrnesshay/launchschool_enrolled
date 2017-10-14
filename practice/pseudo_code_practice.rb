=begin
  given 2 integers
  sum the integers
  return sum
=end

=begin
 START
 SET first_int = its value
 SET second_int = its value
 PRINT first_int + second_int
 END
=end


=begin
 given a collection of strings
 set concatenated_string to nil
 iterate through the collection one by one
   concatenate the iteration string to concatenated_string
 return concatenated_string
=end

=begin
START
#given a collection of strings
SET concatenated_string = nil
SET iterator = 0
WHILE iterator < length of collection
  SET current_string = value within collection at space "iterator"
  concatenated_string += current_string
  iterator += 1
  go to the next iteration
END


=begin
  given a collection of integerrs
  set new_array to nil
  iterate through the collection of integers one by one
    starting with first index, add every other element to new_array
  return new_array
=end

=begin
 #given a collection of integers
 SET new_array = nil
 iterator = 1
 WHILE iterator < length of collection
   SET current_num = value within collection at space "iterator"
   new_array << current_num
   iterator += 2
   go to next iteration
 return new_array
=end