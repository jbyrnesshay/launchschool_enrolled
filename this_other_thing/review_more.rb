def triple_double(num1,num2)
  nums_1, nums_2 = num1.to_s.chars, num2.to_s.chars
  straight_triple = nums_1.select.with_index {|num, i|  [nums_1[i+1], nums_1[i+2]].all? {|test| num == test} }
  matched_double = nums_2.select.with_index {|num, i| straight_triple.any? {|test| num == test} && num == nums_2[i+1] } 
  straight_triple.any? && matched_double.any? ? 1 : 0
end




