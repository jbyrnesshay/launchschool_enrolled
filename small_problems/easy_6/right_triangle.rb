


def triangle(num)
  (1..num).each do |int|
    puts ' ' * (num - int) + '*' * int
  end
end




triangle(15)

def upside_triangle(num)
  num.downto(1) do |int|
    
    puts ' ' * (num - int) + '*' * int
  end
end

upside_triangle(15)


def rev_triangle(num)
  (1..num).reverse_each do |int|
    puts ' ' * (num - int) + '*' * int
  end
end

rev_triangle(7)


def clunky_triangle(num)
  num.times do |index|
    spaces = ' ' * (num - (index + 1))
    stars = '*' * (index + 1)
    puts spaces + stars
  end
end

clunky_triangle(7)