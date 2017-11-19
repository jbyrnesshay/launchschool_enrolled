

def running_total(array)
  total = 0
  array.map { |num| total += num }
end


p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])

def running_total2(array)
  total = 0
  array.each_with_object([]) {|num, new_arr| total += num; new_arr <<total}
end

p running_total2([2, 5, 13])
p running_total2([14, 11, 7, 15, 20])
p running_total2([3])
p running_total2([])

def running_total3(array)
  new_arr = []
  array.inject(0) do |sum, num|
    sum += num
    new_arr << sum
    sum
  end
  new_arr
end
p running_total3([2, 5, 13])
p running_total3([14, 11, 7, 15, 20])
p running_total3([3])
p running_total3([])