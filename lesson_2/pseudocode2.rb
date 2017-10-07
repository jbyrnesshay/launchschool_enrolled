
=begin

START

# Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers at space 1

WHILE iteractor < length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    got to the next iteration
  ELSE
    saved_number = current_number

  iterator = iterator + 1

PRINT saved_number

END

=end

def find_greatest(numbers)
  saved_number = nil
  return if numbers.nil?
  numbers.each do |num|
    saved_number ||= num
    if saved_number >= num 
      next
    else
      saved_number = num 
    end
  end

  saved_number
end

numbers = [5, 4, 10, 2001, 55, -489]
#numbers = nil
puts find_greatest(numbers)


def find_greatest2(numbers)
  saved_number = numbers.first  
  return if numbers.nil?
  numbers.each do |num|
    if saved_number >= num 
      next
    else
      saved_number = num 
    end
  end
  saved_number
end
     
numbo = [50000, 25, -4157, 400008, 34, 787]
puts find_greatest2(numbo)
