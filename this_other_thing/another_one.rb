 
def comp(array1, array2)
  return false if (array1.nil? || array2.nil?)
  array1.sort!.map! {|element| element ** 2 } == array2.sort!
end

#others

def comp(array1, array2)
  array1.nil? || array2.nil? ? false : array1.sort.map {|v| v ** 2} == array2.sort
end

2 similar code variations are grouped with this one
Show Variations

        Best Practices45
        Clever39
    3
    Fork
    Compare with your solution
    Link

elreyatee, JMD1986, diego-silva, smoline, Mu55T, ricardoamaro (plus 2 more warriors)

def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  array1.map {|num| num ** 2}.sort == array2.sort 
end

7 similar code variations are grouped with this one
Show Variations

        Best Practices13
        Clever3
    0
    Fork
    Compare with your solution
    Link

Mess6, SnowDeveloper

def comp(array1, array2)

array1.sort.map {|num| num ** 2} == array2.sort
rescue 
false

end

1 similar code variation is grouped with this one
Show Variations

        Best Practices5
        Clever13
    0
    Fork
    Compare with your solution
    Link

artemuk

def comp(a, b)
  a && b ? a.sort.map {|x| x ** 2} == b.sort : false
end

        Best Practices5
        Clever2
    0
    Fork
    Compare with your solution
    Link

njohnson7

def comp(a, b)
  [a, b].none?(&:nil?) && a.map(&:abs2).sort == b.sort
end

        Best Practices2
        Clever1
    0
    Fork
    Compare with your solution
    Link

g964

def comp(array1, array2)
    if ((array1 == nil) || (array2 == nil)) then return false end
    if (array1.length != array2.length) then return false end
    l = lambda do |x, arr|
        arr.select { |y| x == y}.length 
    end   
    i = 0
    while (i < array1.length) do
        if (l.call(array1[i], array1) != l.call(array1[i] * array1[i], array2)) then return false end
        i += 1
    end
    return true
end

        Best Practices2
        Clever0
    1
    Fork
    Compare with your solution
    Link

tokssss, henrebotha

def comp (array1, array2)
  !array1.nil? && !array2.nil? && array1.sort.zip(array2.sort).all?{|a, b| a**2 == b}
end

1 similar code variation is grouped with this one
Show Variations

        Best Practices1
        Clever2
    0
    Fork
    Compare with your solution
    Link

10XL

def comp(a=[], b=[])
  return false if a.nil? || b.nil?
  a.sort.map { |i| i**2 } == b.sort
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

Anseltis

def comp(x,y)
  x.sort.map{|z|z**2} == y.sort rescue false
end

        Best Practices0
        Clever3
    1
    Fork
    Compare with your solution
    Link

GiacomoSorbi

def comp(a1, a2)
  a1==nil or a2==nil ? false : a1.map{|x|x*x}.sort==a2.sort
end

        Best Practices0
        Clever2
    0
    Fork
    Compare with your solution
    Link

uknable

def comp(array1, array2)
  res = 0
  array1.each do |int|
    res += int**2
  end
  
  if (array1 == nil || array2 == nil)
    return false
  end
  
  if res == array2.inject(0, :+)
    return true
  else
    return false
  end
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

C_Marl

def comp(a1, a2)
  a1.nil? || a2.nil? ? false : a1.map {|n| n * n}.sort == a2.sort || a2.map {|n| n * n}.sort == a1.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

abhiahirwar

def comp(array1, array2)
 return false if array1.nil? || array2.nil?
 return array1.map{ |a| a*a}.sort == array2.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

wei30

def comp(array1, array2)
  array1.nil? || array2.nil? ? false : array1.sort.map{|number|number**2}.sort == array2.sort
  
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

CareyL96

def comp(array1, array2)
  if array1 == nil || array2 == nil 
    return false 
  else  
    array1.each_with_index {|num, i| return false if (array1.sort[i] ** 2) != array2.sort[i]}
    return true
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

sssbb19

def comp(array1, array2)
  puts array1, '---/r', array2
  return array2.map{|x| array1.include?(Math.sqrt(x))}.all?{|y| y==true} && array2.map{|x| Math.sqrt(x)}.sort == array1.sort if array2 != nil && array1 != nil
  return false if array2 == nil || array1 == nil
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

vivaelnino9

def comp(array1, array2)
  return false if array2.nil? or array1.nil?
  return array1.sort == array2.map{|n| Math.sqrt(n)}.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

perezperret

def comp(array1, array2)
  return false if !array1 || !array2
  array1.sort.map { |el| el ** 2 } == array2.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

perezperret

def comp(array1, array2)
  return false if !array1 || !array2

  array1.sort!
  array2.sort!
  
  array1.each_with_index do |el1, i|
    return false if array2[i] != el1 ** 2
  end
  
  true
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

koerner

def comp(array1, array2)
  if (array1.nil? or array2.nil? or array1.size != array2.size)
    return false
  end
  equal = true
  array1.each do |item|
    equal = array2.include?(item * item)
    if !equal
      break
    else
      array2.delete_at(array2.find_index(item * item))
    end
  end
  equal
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

domvernon

def comp(array1, array2)
  if array1.kind_of?(Array) && array2.kind_of?(Array)
    array2.sort.eql?(array1.sort.map{|x| x**2})
  else
    return false
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Vap0r1ze

def comp(array1, array2)
  return false if array2 == nil
  (array1 || []).sort.zip((array2 || []).sort).map{|l| l[0]**2 == l[1]}.reduce(true, :&)
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

moonrider

def comp(array1, array2)

  unless array1.nil? || array2.nil?      
    array1.sort!
    array2.sort!
  
    array1.map!{ |x| x**2 }
    
    array1 && array2 == array1
  else
    return false
  end  

end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

bipinmdr07

def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  array1.sort.map{|x| x**2} == array2.sort ? true : false 
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

gwlee1991

def comp(array1, array2)
  if array1.nil? || array2.nil?
    return false
  elsif array1.empty? && array2.empty?
    return true
  else
    array1.sort.map{|n| n ** 2 } == array2.sort
  end
    
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

cmcguff

def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  array2&.sort == array1.map { |x| x**2 }&.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

margarita2

def comp(array1, array2)
  if array1 == nil || array2 == nil
    return false
  elsif array1 == [] || array2 == []
    return true
  end
  array2 = array2.map{|i| i**0.5}
  array1.sort == array2.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

BCrawfordScott

def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  array2.sort == array1.sort.map { |el| el**2 }
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

joyeusenoelle

def comp(array1, array2)
  unless array1 and array2 
    return false
  end
  a1 = array1.sort()
  a2 = array2.sort()
  a1.each_with_index do |item, idx|
    if item*item != a2[idx] then
      return false
    end
  end
  return true
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

mad.alienn

def comp(array1, array2)
  a_2 = []
  if array1.nil? || array2.nil?
    return false
  else
    array1.each_with_index do |v, i|
      a_2 << array1[i]**2
    end
  end
    a_2.sort == array2.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

jyothi sree

def comp(array1, array2)
if (array1!=nil and array2!=nil)
   b=array1.collect{|x| x*x}
   b.sort{ |x,y| y <=> x } == array2.sort{ |x,y| y <=> x }
else
 return false
end 

end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

hirokiraj

def comp(array1, array2)
  return false unless array1 && array2
  array2.sort == array1.map { |e| e * e }.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

johnolek

def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  return false if array1.size != array2.size
  array1.each do |n| 
    count = array1.count(n)
    return false unless array2.count(n**2) == count
  end
  array2.each do |n| 
    count = array2.count(n)
    return false unless array1.count(Math.sqrt(n)) == count
  end
  true
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

evilsmith

def comp(array1, array2)
  if array1 == [] && array2 == nil
    return false
  end
  p array1
  p array2
  array1 = array1.sort
  array2 = array2.sort
  flag = true
  for index in 0...array1.length 
    if (array1[index] * array1[index]) != array2[index]
      return false
    end
  end  
  return flag
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

dangerousg

def comp(array1, array2)
   if array1 == nil || array2 == nil
    return false
  end
   array1.sort.map {|i| i * i } == array2.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

cchavez

def comp(array1, array2)
  return false unless array1 != nil and array2 != nil
  return false unless array1.length == array1.length
  array1.map{ |n| n * n}.sort == array2.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

MProG

def comp(a, b)
  return false if a.nil? || b.nil? 
  a.sort.map{|el| (el**2)} == b.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

astroserg

def comp(array1, array2)
  new_arr = array1.map {|x| x*x }.sort 
  new_arr2 = array2.sort unless array2.nil?
  if new_arr == new_arr2
    return true 
  else 
    return false
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

victorlaucas

def comp(array1, array2) 
    new_arr = array1.map { |x| x **2 }.sort
    new_arr2 = array2.sort unless array2.nil?
  if new_arr == new_arr2
    return true
  else 
    return false
  end 
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

koscim

def comp(array1, array2)
  sort1 = array1.sort if !array1.nil?
  sort2 = array2.sort if !array2.nil?
  sort1.each_index.select{|index| sort2[index] == sort1[index] * sort1[index] }.length == array1.length && !array1.nil? && !array2.nil?
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

gstokkink

def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  
  squared = array1.map { |x| x ** 2 }
  
  squared.sort == array2.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

woarewe

def comp(array1, array2)
  array1 and array2 ? array1.sort.map { |x| x ** 2 } == array2.sort : array1 == array2
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

thejeremyjohn

def comp(array1, array2)
  (array1!=nil && array2!=nil) && (array1.sort.map{|x|x**2} == array2.sort)
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

thejeremyjohn

def comp(array1, array2)
  !(array1==nil || array2==nil || array1.length!=array2.length) && (array1.sort.map{|x|x**2} == array2.sort)
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

stsolak

def comp(array1, array2)
  if ( array1==[] or array2==[] ) 
    if ( array1==[] and array2==[] )
      true
    else
      false
    end
  else
    array2.sort == array1.sort.map{|x| x*x}
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

knockknockhusthere

def comp(array1, array2)
  return false if (array1 == nil || array2 == nil)
  return true if (array1.length <= 0 || array2.length <= 0) 
  
  
  if (array1.sort!.collect { |x| x**2 } == array2.sort!)
    return true
  else
    return false
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

ajLapid718

def comp(array1, array2)
  return false if array1.nil? || array2.nil?
  x = array1.map { |num| num ** 2 }
  x.sort == array2.sort
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

