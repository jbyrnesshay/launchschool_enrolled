def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id #4524
  b_outer_id = b_outer.object_id #3423
  c_outer_id = c_outer.object_id #4298
  d_outer_id = d_outer.object_id #4524
#above object_id's are each different from eachother

  puts "a_outer is 42 with an id of: 4524 before the block."
  puts "b_outer is forty two with an id of: 3423 before the block."
  puts "c_outer is [42] with an id of 4524 before the block.\n\n"

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was 4524 before the block and is: 4524 inside the block."
    puts "b_outer id was 3423 before the block and is: 3423 vinside the block."
    puts "c_outer id was 4298 before the block and is: 4298 inside the block."
    puts "d_outer id was 4524 before the block and is: 4524 inside the block.\n\n"
  #each line should have 2 values which are equivalent

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0] #44

    puts "a_outer inside after reassignment is 22 with an id of: 4524 before and: 5587 after."
    puts "b_outer inside after reassignment is thirty three with an id of: 3423 before and: 4234 after."
    puts "c_outer inside after reassignment is [44] with an id of: 4298 before and: 1423 after."
    puts "d_outer inside after reassignment is 44 with an id of: 4524 before and: 9964 after.\n\n"
 #each line has 3 values:  the reassigned value, the original object_id, the new object id after reassignment

    a_inner = a_outer #22
    b_inner = b_outer #"thirty three"
    c_inner = c_outer #[44]
    d_inner = c_inner[0] #44
  #a_inner, b_inner, c_inner refer to the same objects as a_outer, b_outer, c_outer respectively
    a_inner_id = a_inner.object_id #5587
    b_inner_id = b_inner.object_id #4234
    c_inner_id = c_inner.object_id #1423
    d_inner_id = d_inner.object_id #9964

    puts "a_inner is 22 with an id of: 5587 inside the block (compared to 5587 for outer)."
    puts "b_inner is thirty three with an id of: 4234 inside the block (compared to 4234 for outer)."
    puts "c_inner is [44] with an id of: 1423 inside the block (compared to 1423 for outer)."
    # the above 3 lines display the same object id "inside" vs "compared"
    puts "d_inner is 44 with an id of: 9964 inside the block (compared to 9964 for outer).\n\n"
    #c_inner was assigned c_outer, ie [44]
    #d_inner was assigned c_inner[0]
    #d_outer was assigned value of c_outer[0] ie [44]
    #puts "d inner is [44] with an id of: 12444 inside the block compared to 12444 for outer"
=begin
    shouold be the same object c_outer is [44], 
    d_outer is assigned c_outer[0] obect
    c_inner is assigned directly the value of c_outer object
    d_inner is assigned directly the value of c_inner[0] which points to the same object as 0th index of c_outer
    same object as d_outer
=end
  end 
#end of times block
  puts "a_outer is 22 with an id of: 4524 BEFORE and: 5587 AFTER the block."
  puts "b_outer is thirty three with an id of: 3423 BEFORE and: 4234 AFTER the block."
  puts "c_outer is [44] with an id of: 4298 BEFORE and: 1423 AFTER the block."
  puts "d_outer is 44 with an id of: 4524 BEFORE and: 9964 AFTER the block.\n\n"
  # these are all different objects

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
  # these lines all output the rescue statements
end