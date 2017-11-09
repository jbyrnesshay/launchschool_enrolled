

def within_range?(num, limit)
  num <= limit
end

def add_eligible_multiple(number, array)
  if (!array.include? number) 
    array << number
  end
end

def create_multiples(limit)
  array = []
  (1..limit).each do |number|
    third = 3 * number
    fifth = 5 * number
    within_range?(third, limit) ? add_eligible_multiple(third, array): nil
    within_range?(fifth, limit) ? add_eligible_multiple(fifth, array): nil
  end
  array.sort
end


def multisum(num)
   multiples = create_multiples(num)
   multiples.inject do |total, number|
    total + number
   end
end


p multisum(1000)