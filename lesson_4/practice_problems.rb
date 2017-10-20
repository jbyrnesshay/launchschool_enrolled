

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# turn this array into a hash where the names are the keys and the values are the positions in the array.

def convert(array)
  my_hash = {}
  array.each_with_index do |item, index|
    my_hash[item] = index
  end
  my_hash
end



#puts convert(flintstones)



#Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
count = 0
ages.each_value do |value|
  count+= value
end
puts count
thing = 0
ages.each do |key, value|
  thing += value
end
puts thing

total_ages = 0
ages.each do |_, value|
  total_ages += value  
end
puts total_ages


puts ages.values.inject(:+)


ages_reset = ages

ages.reject! do |_, value|
  value > 100
end
puts ages.inspect

ages = ages_reset

puts ages.values.min



flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#Find the index of the first name that starts with "Be"
puts flintstones.inspect
puts flintstones.index { |x| x.start_with?("Be")}
# or
#puts flintstones.index { |x| x[0,2] = "Be" }


puts flintstones.inspect

flintstones.map! {|name| name[0,3]
}
puts flintstones.inspect


statement = "The Flintstones Rock"

my_hash = Hash.new(0)
statement.chars.each do |char|
  if char.match(/\w/)
    my_hash[char] += 1
  end
end
puts my_hash.sort.to_h


result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
puts result

