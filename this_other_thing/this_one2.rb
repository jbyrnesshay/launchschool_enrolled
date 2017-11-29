my solutions

def solution(digits, arr = [])
digits.chars.each.with_index {|char, index| arr << digits.slice(index, 5).to_i }
arr.max
end


# other solutions



aterus, maalur, alkimo, ssritt, Tpayns, chweeks (plus 11 more warriors)

def solution(digits)
  digits.split('').each_cons(5).max.join.to_i
end

6 similar code variations are grouped with this one
Show Variations

        Best Practices44
        Clever76
    7
    Fork
    Compare with your solution
    Link

payten, diaryofdiscoveries

def solution(digits)
  (0..digits.length).collect{|i| digits[i, 5].to_i}.max
end

        Best Practices8
        Clever3
    0
    Fork
    Compare with your solution
    Link

jbarker

def solution(digits)
  highest = 0
  for i in 0..digits.length - 5
    v = digits[(i)..(i+4)].to_i
    highest = v if v > highest
  end
  highest
end

        Best Practices3
        Clever0
    1
    Fork
    Compare with your solution
    Link

ddunkin, hamzapurra

def solution(digits)
  digits.to_s.scan(/(?=(\d{5}))/).max[0].to_i
end

1 similar code variation is grouped with this one
Show Variations

        Best Practices2
        Clever1
    0
    Fork
    Compare with your solution
    Link

tomb0y, Unnamed

def solution(digits)
 digits.chars.each_cons(5).map{ |ds| ds.join.to_i }.max
end

1 similar code variation is grouped with this one
Show Variations

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

wx7063

def solution(digits)
      (0..digits.length-5).reduce(digits[digits.length-5,5]){|rt, pos| rt>digits[pos, 5]? rt: digits[pos,5]}.to_i 
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

user9624130

def solution(digits)
  digits.scan(Regexp.new("(?=([0-9]{5}))")).flatten.map(&:to_i).max
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

Anton1998

def solution(digits)
    arr = digits.to_s.split('').map(&:to_i)
    bam = []
    (0...(arr.count - 4)).each {|x| bam.push(arr[x..(x+4)].join.to_i) }
    bam = bam.sort {|a,b| b <=> a}
    return bam[0]
    end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

TheLarkInn

def solution(digits)
  array = []
  n = 0
  for n in 0..digits.length do
    array << digits[n..n+4]
  end
  
  return array.map{|x| x.to_i}.sort.last.to_i
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

savvinovan

def solution(digits)
max = 0
abs_max = 0
  for i in 0..(digits.size-5) do
    i = max + 1 if i < max && i < digits.size
    max = get_max(digits, i)
    abs_max = digits.slice(max, 5).to_i if abs_max < digits.slice(max, 5).to_i
  end
  return abs_max
end

def get_max(digits, start = 0)
  index = start
  for i in 0..(digits.size - 5) do
     index = i if digits[index].to_i < digits[i].to_i
  end
  return index
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

ffrenchm

def solution(digits)
  highest = 0
  (0..(digits.length - 4)).each do |index|
    highest = digits[index, 5].to_i if highest < digits[index, 5].to_i
  end
  highest
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

fonji

def solution(digits)
  max = 0
  (0..digits.length - 5).each do |index|
    max = [max, digits[index..index+4].to_i].max
  end
  max
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

jburdett

def solution(digits)
  max = 0
  (0...(digits.length-5)).each do |i|
    contender = digits[i...i+5].to_i
    max = contender > max ? contender : max
  end
  max
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Le5tes

def solution(digits)
arry = digits.to_s.chars
arry.map.with_index{|x,i| arry[i,5].join.to_i}.max
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

GeorgeWhiting

def solution(digits)
  array = []
  arr = digits.chars.map(&:to_i)
  maxes = arr.each_index.select{|x| arr[x] == arr.max}
  maxes.each {|index| array << arr[index,5].join.to_i}
  array.max
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Mnargh

def solution(digits)
    new_array = []
    digit_array = digits.chars.map(&:to_i)
    location = digit_array.each_index.select{|x| digit_array[x] == digit_array.max}
    location.each {|x| new_array << digit_array[x,5].join.to_i}
    new_array.max
  end
    

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

dnb_critical

def solution(digits)
  max = 0
  (0..digits.size).each do |index|
    combination = digits[index..index+4].to_i
    if max < combination
      max = combination
    end
  end
  max
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

monstar

def solution(digits)
  i = 0
  greatest = 0
  
  while i < digits.length - 1
    possible = (digits[i..i+4]).to_i
    
    if possible > greatest
      greatest = possible
    end
  
    i+=1
  end

  return greatest
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

dankwin

def solution(digits)
  b = 0
  (0..(digits.length-4)).each do |i|
    t = digits[i..(i+4)].to_i
    b = t if t > b
  end
  return b
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

andywynkoop

def solution(digits)
  digits = digits.to_s.split('')
  idx=0
  largest = digits[0].to_i
  while idx<digits.length
    number = (idx..idx+4).reduce([]) {|arr,idx| arr << digits[idx]}.join('').to_i
    largest = number if number>largest
    idx += 1
  end
  largest
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Moirera

def solution(digits)
  arr = digits.chars
  max_indicies = arr.each_index.select { |x| arr[x] == arr.max }
  new_arr = []
  max_indicies.each do |m|
    new_arr.push(digits[m,5].to_i)
  end
  new_arr.max
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

monstar

def solution(digits)
  biggest = 0
  i = 0
  
  while i < digits.length - 5
    sequence = digits[i..(i+4)]
    if sequence.to_i > biggest
      biggest = sequence.to_i
    end
    
    i+=1
  end

  return biggest
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Awjin

def solution(digits)
  (0..digits.length-1)
    .map { |idx| digits.slice(idx, 5).to_i }
    .max
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

laranicolas

def solution(digits)
  d = digits.chars.map.with_index { |item, index|
    digits[index..index+4].to_i if index < digits.size-5 
  }.compact.max
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

ciousiaocing

def solution(digits)
  new = []
  digits_arr = digits.to_s
  0.upto(digits_arr.length-5) do |i|
    new << digits_arr[i..i+4].to_i
  end
  new.max
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Kwalish

def solution(digits)
  biggest = 0
  digit_length = digits.length
  new_digits = digits.to_s.split("")
  (0..(digit_length - 5)).each do |index_start|
    if new_digits[index_start..(index_start + 4)].join.to_i > biggest
      biggest = new_digits[index_start..(index_start + 4)].join.to_i
    end
  end
  biggest
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

lilykuang

def solution(digits)
  all_digits = digits.chars
  start = 0 
  max = 0 
  while start < all_digits.length
    max = [max, all_digits[start..start+4].join.to_i].max
    start += 1
  end 
  return max 
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Le CremeFraiche

def solution(digits)
  highest = 0

  digits.split("").each_with_index do |num, idx|
    break if idx == digits.length - 4

    five_num = digits[idx..(idx+4)].to_i
    if five_num > highest
      highest = five_num
    end
  end

  highest
end