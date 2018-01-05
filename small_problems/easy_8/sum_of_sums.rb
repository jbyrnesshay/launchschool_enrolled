

#Write a method that takes an Array of numbers 
#and then returns the sum of the sums of each leading 
#subsequence for that Array. You may assume that the Array always contains at least one number.

#Examples:


def sum_of_sums(array)
  sum = 0
  sum_group = []
  array.each do |num|
     sum_group << num 
     sum += sum_group.inject(0){|total, n| total + n}
     # can also do this
     # sum += (sum_group << num).inject(0){|total, n| total + n}
  end
  sum
end
p sum_of_sums([3, 5, 2]) 
#== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([1, 2, 3, 4, 5]) == 35


#alternate

def sum_of_sums2(array)
  sum = 0
  array.each.with_index do |num, i|
      sum += array.slice(0..i).inject {|total, item| total + item}
  end
  sum
end
p sum_of_sums2([3, 5, 2]) 
#== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums2([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums2([1, 2, 3, 4, 5]) == 35

#aternate
def sum_of_sums3(array)
  sum = 0
 1.upto(array.size) do |count|
      sum += array.slice(0, count).reduce(:+)
  end
  sum
end
p sum_of_sums3([3, 5, 2]) 
#== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums3([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums3([1, 2, 3, 4, 5]) == 35
