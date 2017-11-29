



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
  return 1 if num <= 1
  num * thing2(num - 1)
end

p thing2(6)