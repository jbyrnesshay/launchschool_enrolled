



def thing(num)
  factorial = 1
  while num > 0
    factorial *= num
    num -= 1
  end
  factorial
end

#p thing(6)

def thing2(num)
  (return 1 if num == 1) else (return nil if num < 0)
  num * thing2(num - 1)
end

p thing2(4)


def thing3(num)
  factorial = 1
  num.times do 
    p num
    factorial *= num
    num -= 1
  end
  factorial

end
#p thing3(5)


def thing4(num)
  (1..num).to_a.reduce(1) {|product, k| product * k }
end

#p thing4(4)

def thing5(num)
  (1..num).to_a.inject(&:*)
end
#p thing5(6)


def thing6(num, i = 1)
  num == 0 ? (return 1) : num < 0 ? (return nil) : nil
  (1..num).to_a.each {|x| i*= x}
  i
end
p thing6(4)
