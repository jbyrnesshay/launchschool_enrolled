
fun = []

test = [[8,13,27], ['apple', 'banana', 'cantaloupe']].each do |arr|
  fun << arr.select do |item|
    if item.to_s.to_i == item
      item > 14
    else  
      item.size < 6
    end
  end
end


      
p test
p fun 