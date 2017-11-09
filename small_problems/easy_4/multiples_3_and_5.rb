

def within_range?(num, limit)
  num <= limit
end

def add_eligible_multiple(number, array)
  if (!array.include? number) 
    array << third
  end
end

def create_multiples(limit)
  array = []
  (1..limit).each do |number|
    third = 3 * number
    within_range?(third, limit) ? add_eligible_multiple(third, array): nil
    if (!array.include? third) && (third <= limit)
      array << third 
    end
    fifth = 5 * number
    if (!array.include? fifth) && (fifth <= limit)
      array << fifth
    end
  end
  array.sort
end


def multisum(num)
   multiples = create_multiples(num)
   multiples.inject do |total, number|
    total + number
   end
end


p multisum(5)