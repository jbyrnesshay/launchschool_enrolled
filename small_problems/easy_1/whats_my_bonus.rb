

def calculate_bonus(salary, bonus)
  if bonus
    salary / 2
  else 0
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000


#the above is equivalent logic to 
def calculate_bonus2(salary, bonus)
  bonus ? (salary /2) : 0
end
