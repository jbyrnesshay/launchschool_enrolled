 
# Let's say we have the following 
# data structure of nested arrays 
# and we want to increment 
# every number by 1 without changing the data structure.

[ [[1, 2], [3, 4]], [5, 6] ].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

line    action       object         side_effect      return_val     is ret_Used?
7.   method call (map), nested outer array, no side effect, new array result from map, not used
7-17. outer block execution, each 1st level sub_array, no side effect, outer map return new array, used by outer map 

8 method call(map), each1st level sub array, no side effect, inner map new array, used by outer map
8-16 inner block execution, each sub array, no side, inner map new array, used by outer map
9. method call size, string, no side, integer, used by conditional
9.  method call to_s, array or integer, no side, string, used by size method
9 if expression, '', no side, boolean, used by if else expression
9-15 if else expression, '', no side, last expression, used by inner map
12 method call map, 2nd level subarray, no side, new array, used by 2nd level map
13.  + operator, integer, no side, integer, used by 3rdlevel map