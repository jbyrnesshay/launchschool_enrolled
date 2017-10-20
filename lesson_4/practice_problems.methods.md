


1.   [1,2,3]
2.  if an argument is given, counts the number of elements which equal obj using ==.
   if a block is given, counts the number of elements for which block returns a true value (using ruby -docs documenttion, Enumberable, also Array, ie, count considers the truthiness of the blocks return value)

   3.  [1,2,3] because the return value of the block is nil and reject considers the falsiness of the block, ie. rejecting element for ehich block returns true, ie, returns element for which block is not true.  reject returns an array consiting of elements for which the given block is not true.  in this case, retruns everytihing which is not nil
4. each_with_object returns the object passed in as an argument
according to enumerator documentation

5. shift removes and returns the first key, value pair in the collection and returns it as an array ie [:a, 'ant']
6. pop removes the last element from self and retuens it to size.   sizee, alias for length, returns number of elements in self

7. blcok returns e last statement in the block, the result of num.odd?, which is tha boolean, class:integer
any? returns a boolean, true if 

8. returns first n elements from the array, ie.  array.take(n)
it is not destructive, docs say returns new_array

9. returns a new array containing the values returned by the block, where the block is invoked once for each instance of self.  if the condition evaluates to false, no value is returned, and in that case, the block returns nil

10.  [1,nil,nil]
     where num > 1, puts num returns nil, so each such instance of self is mapped to nil.