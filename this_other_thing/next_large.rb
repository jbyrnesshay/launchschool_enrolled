def next_bigger(n)
  nums = n.to_s.chars
  test = nums.sort.uniq
  size = nums.size
  index = -1
  (size - 1).times do |x|
    p test
    if (test.max != nums[index])
      next_large = test[test.index(nums[index])+ 1] if (test[test.index(nums[index]) + 1] > nums[index])
    else
      i_end = nums[index]
      nums[index] = nums[index - 1]
      nums[index - 1] = i_end
      #p nums.join.to_i
      next_large = nums.join.to_i
    end
    break if next_large > n
    index -= 1
  end
   next_large <= n.to_i ? -1 : next_large
end