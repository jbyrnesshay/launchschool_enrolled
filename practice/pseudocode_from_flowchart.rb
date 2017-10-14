=begin
  
Let's suppose that in our larger problem, we're asking the user to give us N collections of numbers. 
We want to take the largest number out of each collection, and display it.
i.e., in a collection of collections, we need to iterate and find the largest num in each collection
and display all of these
=end

=begin
given N collections of integers
assign all collections to a larger collection to contain them
i.e.
set large_collection to N collections of integers
set result_collection to nil
iterate through large_collection
  find "largest_int" in current collection
  add largest_int to result_collection
return result_collection
=end
=begin
  define subprocess "largest_int" logic
  in current_collection:
  iterator = 0
  SET largest = value within current_collection at space "iterator"
  WHILE iterator < length of current_collection
    SET current_num = value within current_collection at space "iterator"
    if largest >= current_num
      next
    else 
      largest = current_num
    iterator += 1
    go to next iteration
  PRINT largest
=end
=begin
  SET group = N collections of integers
  SET results = []
  iterator = 0
  WHILE iterator < length of group
    SET current_collection = collection within group at space "iterator"
    SET largest_num = SUBPROCESS "largest_int"
    resulrts << largest_num
    iterator += 1
    go to next iteration
  PRINT results
=end

