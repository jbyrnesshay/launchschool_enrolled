

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

puts "#{arr1} is #{arr1.object_id}" 
puts "#{arr2} is #{arr2.object_id}"


arr5 = ["a", "b", "c"]
arr6 = arr1.clone
arr6[1].upcase!

puts "#{arr5} is #{arr5.object_id}" 
puts "#{arr6} is #{arr6.object_id}"

arr3 = ["a", "b", "c"]
arr4 = arr3
arr4[1].upcase!
puts "#{arr3} is #{arr3.object_id}"
puts "#{arr4} is #{arr4.object_id}"
####



puts
puts
puts '*****'
tester = 'k'
puts tester.object_id
arr9 = ['j', tester, 'l']
puts arr9[1].object_id
arr10 = arr9.clone
p arr9.object_id
p arr10.object_id
p "#{arr9[1].object_id} + 'is'"
p "#{arr10[1].object_id} + 'is'"
arr9[1] = 'b'
p arr9
p arr10
p tester
puts "pppppp"
arr11 = ['j', 'k', 'l']
arr12 = arr11
p arr11.object_id
p arr12.object_id
p "#{arr11[1].object_id} + 'is'"
p "#{arr12[1].object_id} + 'is'"
arr12[1] ='b'
p arr11
p arr12

arr9 = ['j', 'k', 'l']
arr10 = arr9.clone
arr10[1].upcase!
p arr9
p arr10

arr11 = ['j', 'k', 'l']
arr12 = arr11
arr12[1].upcase!
p arr11
p arr12

