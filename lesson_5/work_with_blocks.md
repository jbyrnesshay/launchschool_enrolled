line  action           object       side_effect   return_val  is returnvalue used
1     methodcall(map)  outerarray    none         [1, 3]      no
1-4   block execution   sub arrays   none          1 and3      yes by mao
2     nethod call *firs*  subarray   none         1, 3         yes by outs
2     mrthod call puts    [0] ubdex each sarray output   nil    no
3    netgid call 'first;   sub arays   none         1, 3      yes by block execution'

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

line    action       object         side_effect      return_val     is ret_Used?
1      methodcall(=)  variablemy_arr   yes?assignment objto returned by expression on right of operator    nosuba

1.  methd_call each    outerarray      no           callin obj      yes, by =
1-7  block execution   subarrays     no              subarray      no
2.  method_call each    each subarray    no           subarra       yes by outereach
2-6 block execution     element in array  no         nil    no
3-5. conditional statement(if)  num instance     no         nil(lst ecpression)  yes retue=rn cal iner vlockj
3.  method_call >       num instancw    no     boolean     yrs       conditional statement
4. method callputs      num             print string int of nm    nil   no
5. 
