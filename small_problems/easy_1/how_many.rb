vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

#count_occurrences(vehicles)

def count_occurrences(array)
  my_hash = Hash.new(0)
  array.each {|x| my_hash[x] += 1}
  #puts my_hash.inspect
  #puts my_hash['birds']
  my_hash.each {|key,val| puts key + ' => ' + val.to_s}
end

count_occurrences(vehicles)