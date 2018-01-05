def isTriangle(a,b,c)
=begin
   a + b > c
   a + c > b
   b + c > a
=end
   sides = []
   sides.push(a.to_s,b.to_s,c.to_s)
    
   sides.all? do |side|
    lengths = sides.select.with_index {|x, index| x.object_id != side.object_id  }
     side.to_i < lengths.inject(0) {|sum, y| sum + y.to_i }
   end
end
 
 def isTriangle(a,b,c)
  sides = [a,b,c]
  sides.all? do |side|
    total = sides.inject(0) {|sum, x| sum + x }
    side < total - side
  end
end

def find_even_index(arr)
  left_sum = 0
  right_sum = arr.reduce(:+)
  
  arr.each_with_index do |e, ind|
    right_sum -= e
    
    return ind if left_sum == right_sum

    left_sum += e
  end
  
  -1  
end

1 similar code variation is grouped with this one
Show Variations

def find_even_index(arr)
  (0..arr.length - 1).each do |x|
    left = arr.slice(0, arr.length - arr.length + x)
    right = arr.slice(x+1..arr.length)
    leftsum, rightsum = 0,0
    left.each {|x| leftsum += x } if !left.nil?
    right.each {|x| rightsum += x }if !right.nil?
    return x if leftsum == rightsum
  end
  return -1
end

        Best Practices66
        Clever13
    7
    Fork
    Compare with your solution
    Link

spurnaye, MKBRDME

def find_even_index(ary)
  0.upto(ary.length).select{|l| ary[0..l].reduce(:+) == ary[l..-1].reduce(:+)}.first || -1
end

        Best Practices10
        Clever51
    5
    Fork
    Compare with your solution
    Link

angie1024, ARPerry87

def find_even_index(arr)
  arr.length.times do |idx|
    if arr[0...idx].inject(0, :+) == arr[(idx + 1)..-1].inject(0, :+)
      return idx
    end
  end
  
  return -1
end

1 similar code variation is grouped with this one
Show Variations

        Best Practices7
        Clever5
    1
    Fork
    Compare with your solution
    Link

ferrerluis

def sum_array(arr)
  arr.inject(0, :+)
end

def find_even_index(arr)
  right = sum_array(arr)
  left = 0
  arr.each_with_index do | num, index |
    right -= num
    if left == right
      return index
    end
    left += num
  end
  
  -1
end

        Best Practices3
        Clever1
    0
    Fork
    Compare with your solution
    Link

lambda4fun

def find_even_index(arr)
  left = 0
  right = arr.reduce(&:+)
  arr.each_with_index do |x, i|
    right -= x
    return i if left == right
    left += x
  end
  -1
end

        Best Practices2
        Clever0
    1
    Fork
    Compare with your solution
    Link

WillLearn

def find_even_index(arr)
  v = arr.each_index.select do |i|
    arr[0...i].inject(0, :+) == arr[i+1..-1].inject(0, :+)
  end
   v[0] ? v[0] : -1
end

        Best Practices2
        Clever2
    1
    Fork
    Compare with your solution
    Link

Dascr32

def find_even_index(arr)
  even_index = []
  arr.each_index do |index|
    left_sum = arr[0...index].inject(:+)
    right_sum = arr[index + 1...arr.length].inject(:+)
    
    even_index << index if left_sum.to_i == right_sum.to_i
  end
  even_index.empty? ? -1 : even_index.min
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

LochandQuay

def find_even_index(arr)
  arr.each_with_index do |el, i|
    sum_left = 0
    sum_right = 0
    
    (0..i).each do |idx|
      sum_left += arr[idx]
    end
    
    (i..arr.length - 1).each do |idx|
      sum_right += arr[idx]
    end
    
    return i if sum_left == sum_right
    end
    
    return -1
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

Oleh Sliusar

def find_even_index(arr)
arr.unshift(0).push(0)
  for i in 1..arr.length
    if arr[0..i].inject(:+) == arr.drop(i).inject(:+)
      index ||= i - 1
    end
  end
  index ||= -1
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

taleh007

def find_even_index(arr)
  arr.each_with_index do |x, i|
    return i if (arr[0...i].reduce(0,:+))*2==(arr.reduce(-x,:+))
  end
  -1
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

Ethane

def find_even_index(arr)
  arr.each_with_index { |a, i| return i if arr.first(i).reduce(0, :+) == arr[i+1..arr.size].reduce(0, :+) }
  -1
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

c0nspiracy

def find_even_index(arr)
  (0...arr.length).detect(->{ -1 }) { |index|
    arr[0...index].inject(0, :+) == arr[(index + 1)..-1].inject(0, :+)
  }
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

Nick-Brennan

def find_even_index(arr)
  for i in 0...arr.length
    left = 0
    right = 0
    for j in 0...i
      left += arr[j]
    end
    for k in i+1...arr.length
      right += arr[k]
    end
    if(left == right)
      return i
    end
  end
  return -1
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

ahmetabdi

def find_even_index(array)
  array_size = array.length
  result = -1
  array.each_with_index do |a, index|
    left_side = array[0..index]
    right_side = array[index..array_size]
    if left_side.inject(:+) == right_side.inject(:+)
      result = index
      break
    end
  end
  result
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

wallchuck

def find_even_index(arr)
  n = arr.size

  for i in 0...n do
    return i if arr[0...i].reduce(0, :+) == arr[(i + 1)...n].reduce(0, :+)
  end
  
  -1
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

vargan

def find_even_index(arr)
  arr.each_index do |i|
    return i if arr[0..i].inject(:+) == arr[i..-1].inject(:+)
  end
  -1
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

dandelionheyz

def find_even_index(arr)
  #your code here
  0.upto(arr.length-1) do |n|
    return n if arr[0...n].reduce(0,:+) == arr[n+1..-1].reduce(0,:+)
  end
  -1
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

fourwalls

def find_even_index(arr)
  index = -1
  i=0
  while i < arr.length
    if i == 0
      left = [0]
    else
      left = arr[0..(i-1)]
    end
    if i == arr.length-1
      right = [0]
    else
      right = arr[(i+1)..-1]
    end
    if left.inject(&:+) == right.inject(&:+)
      index = i
      break
    end
  i+=1
  end
  index
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

dlugo06

def find_even_index(arr)
  sums = []
  last_index = arr.length - 1
  index = 0
  arr.each do |e|

    left_sum = 0
    right_sum = 0
    left_items = arr[0..index]
    left_items.reverse!.shift
    left_items.reverse!
    right_items = arr[index..last_index]
    right_items.shift

    if index == 0
      left_sum = 0
    else
      left_sum = left_items.inject(:+)
    end
    if index == last_index
      right_sum = 0
    else
      right_sum = right_items.inject(:+)
    end
    sums << index if left_sum == right_sum
    index +=1
  end
  sums.empty? ? -1 : sums.sort.first
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

Skomantas

def find_even_index(arr)
  results = []
  arr.each_index do |i|
    results << i if arr[0..i].reduce(:+) == arr[i..arr.size].reduce(:+)
  end
  results.min || -1
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

Insti

class Array
  def sum
    reduce(0,:+)
  end
  def left_of(index)
    slice(0,index)
  end
  def right_of(index)
    slice(index+1,size) 
  end
  def indices
    (0...size)
  end
end

def find_even_index(arr)
  arr.indices.find(->{-1}) { |index| arr.left_of(index).sum == arr.right_of(index).sum }
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

MidnightsFX

def find_even_index(arr)
  arr.length.times do |i|
  right = arr[(i)..-1].inject(:+)
  left = arr[0..(i)].inject(:+)
  return i if left == right
  return -1 if i+1 == arr.length
  end
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

elenamorton

def find_even_index(arr)
  return - 1 if arr.size > 1000 || !arr
  arr.each_index do |index|
    if arr.drop(index).reduce(:+) == arr.take(index+1).reduce(:+)
        return index
    end
  end
  -1
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

scizor666

def find_even_index(arr)
  arr.find_index.with_index { |n, i| arr[0...i].inject(&:+).to_i == arr[i + 1..-1].inject(&:+).to_i } || -1 
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

reenapatil

def find_even_index(arr)
  total = arr.inject(0, :+)
  sumLeft = 0
  index = 0
  for item in arr do
    total = total - item
    if total == sumLeft
      return index
    end
    index = index + 1
    sumLeft = sumLeft + item
  end
  return -1;
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

sophieheb

def find_even_index(arr)
  #your code here
  arr.each_index{|i| if arr[0, i].inject(0, :+) == arr[i + 1, arr.length].inject(0, :+) then  return i end}
  return -1
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

acerroblanco

def find_even_index(arr)
  
  
  arr.each_index do |idx|
  
    left_arr = arr.take(idx)
    right_arr = arr.drop(idx+1)
    
    return idx if left_arr.reduce(0,:+) == right_arr.reduce(0,:+)

  end
  
    return -1
  
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

acerroblanco

def find_even_index(arr)
  
  
  (0..arr.length-1).each do |num|
  
    two_arrs = arr.partition.with_index{|element, idx| idx <= num}
  
    two_arrs[0][-1] = 0
    two_arrs[1][0] = 0 if two_arrs[1].empty?
   
    return num if two_arrs[0].reduce(:+) == two_arrs[1].reduce(:+)
  
  end
  
    return -1
  
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

pbslavin

def find_even_index(arr)
  index = -1
  arr.each_with_index do |num, idx|
    if idx == 0
      left = [0] 
    else
      left = arr[0...idx]
    end
    if idx == arr.length - 1
      right = [0]
    else
      right = arr[idx + 1..arr.length - 1]
    end
    if left.reduce(:+) == right.reduce(:+)
      index = idx 
      break
    end
  end
  index
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Sebastian Palma

def find_even_index(arr)
  rdc = ->(e) { e.reduce 0, :+ }
  rng = ->(_, i) { [arr[0..i], arr[i+1..-1]].map &rdc }
  ary = arr.map.with_index &rng
  -> {
    return 0 if ary[0] == ary[-1]
    rvrs = -> ((x, y), i) { i if x == y.reverse }
    ary.each_cons(2).map.with_index(1, &rvrs).compact[0]
  }.call || -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

dancinglightning

def find_even_index(arr)
  forward, reverse = sums(arr) , sums(arr.reverse).reverse
  forward.each_with_index{| f , i| return i  if reverse[i] == f}
  -1
end

def sums(arr)
  (1 ... arr.length + 1).collect{ |x| arr[0 .. x-1].inject(:+)}
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

sssbb19

def find_even_index(arr)
  idx_arr = []
  idx = 1  
  while idx <= arr.length - 1
    arr1 = arr[0..(idx-1)]
    arr2 = arr[(idx+1)..-1]
    if arr1.inject(0,:+) == arr2.inject(0,:+)
      idx_arr << idx
    end
    idx += 1
  end
#   puts idx_arr
  if arr[1..-1].reduce(:+) == 0
    return 0
  elsif idx_arr.length >= 1 
    return idx_arr.first
  else
    return -1
  end 
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

dancernerd32

def find_even_index(arr)
  last_idx = arr.length - 1
  arr.each_with_index do |int, index|
    return index if arr[0..index].reduce(&:+) == arr[index..last_idx].reduce(&:+)
  end
  -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

markfranciose

def find_even_index(arr)
  arr.each_with_index {|n, i| return i if arr[0...i].inject(0, :+) == arr[i+1..-1].inject(0, :+)}
  -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

markfranciose

def find_even_index(arr)
  n = 0
  while n < arr.length
    a = arr[0...n].inject(:+) || 0
    b = arr[n+1..-1].inject(:+) || 0
    return n if a == b
    n += 1
  end
  
  -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

dikond

def find_even_index(arr)
  total_sum = arr.reduce(:+) || 0
  return 0 if arr.empty? || total_sum.zero?

  total_mean = total_sum / 2.0
  acc = 0

  0.upto(arr.size - 1) do |i|
    prev, current = arr.values_at(i - 1, i)
    acc += prev unless i.zero?
    mean = total_mean - (current / 2.0)

    return i if acc == mean 
  end

  -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

negatives

def sum(arr)
  sum = 0 
  
  i = 0 
  while i < arr.length 
    sum = sum + arr[i]
    i += 1 
  end 
  
  sum 
end 

def find_even_index(arr)
  i = 0 
  while i < arr.length 
    left = arr.slice(0...i)
    right = arr.slice(i+1..-1)
    left_sum = sum(left)
    right_sum = sum(right)
      if left_sum == right_sum 
        return i 
      end 
    i += 1 
  end 
  return -1
 end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

bfauble34

def find_even_index(arr)
  (0...arr.length).each do |index|
    one = arr[0..(index)].to_a.inject(0){|x, y| x + y}
    two = arr[index...arr.length].to_a.inject(0){|x, y| x + y}
    puts two
    if one == two
      return index
    end
  end
  -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

ssanchezmarc

def find_even_index(arr)
  return 0 if (arr.inject(0) { |sum, n| sum + n  } == 0)
  arr.each_index { |index|
print index
    left_side = arr.take(index)
    print left_side
    right_side = arr.drop(index+1)
    print right_side
    left_side_sum = left_side.inject(0) { |sum, n| sum + n }
print left_side_sum
    right_side_sum = right_side.inject(0) { |sum, n| sum + n }
print "next"
print right_side_sum
print "condition"

    return index if(left_side_sum == right_side_sum)
  }
  -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

jonnyweb

def find_even_index(arr)
  right = arr.inject(:+)
  left = 0
  index = -1
  
  arr.each_with_index do |v,i|
    right = right - v
    
    if (left == right)
      index = i
      break
    end
    
    left = left + v
  end
  
  return index
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

adrienpoly

def find_even_index(arr)
  (0..arr.length).each do |index|
    return index if (arr[0...index]&.reduce(0, :+) == arr[index + 1..-1]&.reduce(0, :+))
  end
  return -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

polkadotazn

def find_even_index(arr)
  idx = 0
    while idx < arr.length
      idx2 = 0
      idx3 = idx + 1
      sum1 = 0
      sum2 = 0
      
      while idx2 < idx
        if true
          sum1 += arr[idx2]
          idx2 += 1
        end
      end
      
      while idx3 < arr.length
        if true
          sum2 += arr[idx3]
          idx3 +=1
        end
      end
      
      if sum1 == sum2
        return idx
      end
      idx += 1
    end
  return -1   
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

boultoa

def sum(arr)
  return 0 if arr.nil?
  arr.reduce(:+)
end

def find_even_index(arr)
  left = 0
  right = sum(arr[1..-1])
  position = 0
  while position < arr.size - 1
    return position if left == right
    left += arr[position]
    right -= arr[position + 1]
    position += 1
  end
  return position if left == right
  -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

willjthorp

def find_even_index(arr)
  right_side = arr.inject(:+)
  left_side = 0
  arr.each_with_index do |num, index|
    right_side -= num
    return index if right_side == left_side
    left_side += num
  end
  -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

BeejLuig

def find_even_index(arr)
  result = arr.find_index.with_index do |x,i|
    (arr.slice(0,i).inject(:+) || 0) == (arr.slice(i+1, arr.length).inject(:+) || 0)
  end
  result || -1
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

tavis2017

def find_even_index(arr)
  i = 0
  while i < arr.length
    if arr.reduce(:+) == 0
      return 0
    elsif arr[0...i].reduce(:+) == arr[i+1..-1].reduce(:+)
      return i
    elsif arr[1..-1].reduce(:+) == 0
      return 0
    elsif arr[0..-2].reduce(:+) == 0
      return arr.length - 1
    end
    
    i += 1
  end
  
  -1
end



def persistence(n)
  n < 10 ? 0 : 1 + persistence(n.to_s.chars.map(&:to_i).reduce(:*))
end

4 similar code variations are grouped with this one
Show Variations

        Best Practices39
        Clever118
    7
    1
    Fork
    Compare with your solution
    Link

eskalopich

def persistence(n)
  k = 0
   while n > 9 do
    n = n.to_s.split(//).map{|x| x.to_i}.inject(:*)
    k+=1
   end
  k 
end

        Best Practices16
        Clever7
    0
    Fork
    Compare with your solution
    Link

thomas.programming, sebfisch

def persistence(num)
  if num < 10 then
    return 0
  else
    return 1 + persistence(num.to_s.chars.inject(1) { |n,c| n * c.to_i })
  end
end

        Best Practices5
        Clever4
    0
    Fork
    Compare with your solution
    Link

aiywatch

def persistence(n)
    # your code
    ans = 0
    while (n>9)
      m = 1
      while n > 0
        m *= n % 10
        n /= 10
      end
      n = m
      ans += 1
    end
    ans
end

        Best Practices5
        Clever1
    0
    Fork
    Compare with your solution
    Link

RubyGemDrew

def persistence(n)
    str = n.to_s.chars.map(&:to_i)
    return 0 if str.length == 1
    1 + persistence(str.inject(&:*))
end

        Best Practices3
        Clever0
    0
    Fork
    Compare with your solution
    Link

krackos

def persistence(n)
    num = n.to_s.split("")
    return ((persistence(num.map(&:to_i).reduce(&:*)))+1) if num.size > 1
    0
end

        Best Practices2
        Clever1
    0
    Fork
    Compare with your solution
    Link

radical56, mpkguru

def persistence(n)
  n < 10 ? 0 : 1 + persistence(n.to_s.split('').map(&:to_i).reduce(:*))
end

1 similar code variation is grouped with this one
Show Variations

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

jhwang767

def persistence(n)
    count = 0
    while n >= 10
      j = 1
      n.to_s.chars.each do|i|
        j = j * i.to_i
      end
      n = j
      count += 1
    end
    return count
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

Carl_C_CryMoar

def persistence(n)
    ans = 0
    loop { prod = 1
      if n >= 10;  n.to_s.split(//).each { |x| prod *= x.to_i } else return ans end
      n = prod
      ans += 1
      }
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

Yoshyn

def persistence(n)
  result = 0
  while(n > 9) do 
    n = n.to_s.chars.map(&:to_i).inject(:*)
    result += 1; 
  end
  result
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

nekokat

def persistence(n)
  return 0 if n.to_s.size == 1
  i = 0
  while n.to_s.size != 1
    n = eval(n.to_s.split("").join("*"))
    i += 1
  end
  i
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

RPAzevedo

def persistence(number)
  persist = 0
  while number > 9 do
    number = multiply(digits(number))
    persist += 1
  end
  persist
end

def digits(number)
  list = []
  begin
    list << number % 10
    number /= 10
  end while number > 0
  list
end

def multiply(numbers)
  numbers.inject(1) do |multiplication, number|
    multiplication *= number
  end
end  

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

jucetan

def persistence(n)
  p_count = 0
  
  if n < 10 then
    return 0
  else
    return 1 + persistence(n.to_s.chars.inject(1) {|n,c| n * c.to_i})
  end 
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

AdeptTechnicus

def split_to_single_digits(n)
  return n.to_s.split("").map{ |n| n.to_i }
end

def persistence(n)
  digits = split_to_single_digits(n)
  times = 0
  until digits.length == 1 do
    digits = split_to_single_digits digits.reduce(:*)
    times += 1
  end
  return times
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

mbronek7

def persistence(n)
    return n<10? 0 : 1 + persistence(n.to_s.chars.map{|i| i.to_i}.reduce(:*))
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

mbronek7

def persistence(n)
    persistence2(n,0)
end

def persistence2(n,i)
    temp = 1
    i+=1
    if n/10 == 0
       return 0
    end
    while n>0
         temp*=n%10
         n/=10
    end
    if temp / 10 == 0
       return i 
    end 
    persistence2(temp,i)
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

johneckert

def persistence(n)
  counter = 0
  while n >= 10
    n = combine(n)
    counter += 1
  end
  counter
end

def combine(n)
  x = 1 #return value
  n.to_s.split(//).each { |d| x *= d.to_i }
  x
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

ker-an

def persistence(num)
  mult_persistence = 0
  num_length = num.to_s.length
  if num_length == 1
    return mult_persistence
  end
  while num_length > 1
    num = num.to_s.split('').map { |digit| digit.to_i }.inject(:*)
    mult_persistence += 1
    num_length = num.to_s.length
  end
  mult_persistence
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Svetozar

def persistence(n)
    step = 0
    while n > 9
        result = 1
        n.to_s.split('').each { |i| result*= i.to_i }
        n = result
        step+=1
    end
    step
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

shxxu0212

def persistence(n)
  count = -1
  digits = []
  product = n
  ## digits = [digit, digit]
  ## product = digits.reduce
  
  until digits.size == 1
    digits = split_num(product)
    product = digits.reduce(:*)
    count += 1
  end
  
  count
  
end

def split_num(num)
  num.to_s.split('').map { |el| el.to_i }
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

bhanu0708

def persistence(n)
  if (n.to_s.length==1)
    return 0
  end
  count = 0
while(1)
  count += 1
    str=n.to_s
  temp=1
    str.split("").each do |num|
          temp=num.to_i*temp   
    end
    if temp.to_s.length==1
        return count
    end
    n=temp
end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Ciancion

def persistence(n)
   n = n.to_s.split(//)
   n_length = n.length
   count = 0
   while n_length != 1
     if n_length == 1
       count = 0
     else
       n = n.inject{|product, i| product.to_i * i.to_i}
       n = n.to_s.split(//)
       n_length = n.length
       count += 1
     end
   end
   count
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

dallinder

def persistence(n)
    result = 0
    loop do
      break if n.to_s.size == 1
      n = n.to_s.chars.map { |num| num.to_i }.inject(:*)
      
      result += 1
    end
    result
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

pbslavin

def persistence(n)
  product = 1 
  count = 0
  while n.to_s.length > 1
    n.to_s.each_char do |digit|
      product *= digit.to_i
    end
    n = product
    product = 1
    count += 1
  end
  count
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

marcusmau

def persistence(n)
  compteur = 0
  while n.to_s.length > 1
    prod = 1
    n.to_s.chars.map(&:to_i).each {|i| prod = prod * i}
    n = prod
    compteur += 1
  end
  compteur
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Speck

def persistence(n)
  count = 0
  
  while n >= 10
    num_arr = n.to_s.split("").map { |num| num.to_i } #Break digits into array of int digits
    n = num_arr.inject {|sum, dig| sum * dig} #sum array
    count += 1
  end
  
  return count
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

cmsousa

def persistence(num)
    count = 0
    until num < 10
      digits = num.to_s.split(//).map(&:to_i)
      num = digits.reduce(:*)
      count += 1
    end
    count
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

cmsousa

def persistence(num)
    count = 0
    until num < 9
      digits = num.to_s.split('').map { |digit| digit.to_i }
      num = digits.reduce(1) { |acc, digit| acc *= digit}
      count += 1
    end
    count
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

jbyrnesshay

def persistence(n)
    persistence = 0
    while n >= 10
      nums = n.to_s.chars.map(&:to_i)
      n = nums.reduce(&:*)
      persistence += 1
    end
    persistence
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

kangstephen94

def persistence(n)
    if n.to_s.length < 2
      count = 0
    else 
      count = 1
    end
    result = multiply_digits(n)
    until result < 10
      result = multiply_digits(result)
      count = count + 1 
    end 
count
end



def multiply_digits(n)
  result = 1
  arr = n.to_s.split('')
  arr.each do |num|
    result = result * num.to_i 
  end 
result
end 

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

joshualacey

def persistence(n)
  recursive(n)
end

def recursive(n, count = 0)
n_to_s = n.to_s
array = n_to_s.scan(/./).map{ |n| n.to_i }
  if array.length == 1
    count
  else 
    count += 1
    product = array.reduce(1, :*)
    recursive(product, count)
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

xarques

def persistence(n)
  if n.to_s.size == 1 
    return 0
  end
  res = 1
  while true
    prod = n.to_s.chars.reduce(1) { |product, char| product * char.to_i }
    if prod.to_s.size == 1
      return res
    else
      n = prod
      res+= 1
    end
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

matd.h

def persistence(n)
  if n.to_s.length == 1
    0
  else
    p = n.to_s.split('').map(&:to_i).reduce(:*)
    1 + persistence(p)
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

polkadotazn

def persistence(n)
  counter = 0
  new_num = n
    while new_num > 9
      idx = 0
      product = 1
      while idx < new_num.to_s.length
        product *= new_num.to_s[idx].to_i
        idx += 1
      end
      counter += 1
      new_num = product
    end
  return counter
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

protolexus

def persistence(n)
  found = false
  count = 0
  if n.to_s.length == 1
    found = true
  end
  while found == false
    count += 1
    n_arr = n.to_s.each_char.map { |c| c.to_i }
    n_multi = n_arr.reduce(:*)
    if n_multi.to_s.length < 2
      found = true
    end
    n = n_multi
  end
  count
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

hoaiphun96

def persistence(n)
    # your code
    count = 0
    if n < 10
      return count
    else 
      #print( (n.to_s.split('')).inject(1) {|product, n| product * n })
      count = 1 + persistence((n.to_s.split('')).inject(1) {|product, x| product *  (x.to_i) })
    end
    count
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

sandemchad

def persistence(n)
  str_n = n.to_s
  depth = 0
  while str_n.length > 1
    str_n = eval(str_n.split("").join(" * ")).to_s
    depth += 1
  end
  
  depth
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

hooptheyoda

def persistence(n) 
  count = 0
  while (n > 9)
    count += 1
    n = n.to_s.split('')
    num = 1
    
    n.map! do |x| 
      num = num * x.to_i
    end
    n = n.last
  end 
  count
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

admiun

def persistence(n, count=0)
    arr = n.to_s.chars.map(&:to_i)
    
    return count if arr.size == 1
    
    persistence(arr.reduce(1, &:*), count + 1)
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

BertZZ

def persistence(n)
  cycles = 0
  number = n
  
  while number >= 10
    array = number.to_s.split('').map {|e| e.to_i}
    number = array.inject(:*)
    cycles += 1
  end
  cycles
end