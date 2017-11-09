

def within_range?(num, limit)
  num <= limit
end

def add_eligible_multiple(number, array)
  if (!array.include? number) 
    array << number
  end
end

def create_multiples(list, limit)
  array = []
  (1..limit).each do |number|
    list.each do |multiplier|
      multiple = multiplier * number
      within_range?(multiple, limit) ? add_eligible_multiple(multiple, array): nil
    end
  end
  array.sort
end


def multisum(options = {})
   multiples = create_multiples(options[:multiples], options[:limit])
   multiples.inject do |total, number|
    total + number
   end
end

# user configurable values (list is a list of multipliers)
list = [3,5]
limit = 1000

parameters = {:limit => limit, :multiples => list}

p multisum(parameters)