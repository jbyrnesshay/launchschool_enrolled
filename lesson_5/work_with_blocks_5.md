

line       action       object        side_effect          returnval      used?
1           method(map)  outerarray     no                new array   no
1-5       block_execution   subarray    no              callingojbect(subarray)
2         method(map)    subarray      no               new arry           yes by outer map
2-4      inner block execuation   each subarray element  no  integer        yes by inner map
3          * operator   each subarrau element no        integer           yes by inner block



1    [[1, 2], [3, 4]].map do |arr|
2  arr.map do |num|
3    num * 2
4  end
5 end

What will the return value be in this example? Use what you've learned so far to break it down on your own before checking the solution below.

[[2,4], [6,8]]