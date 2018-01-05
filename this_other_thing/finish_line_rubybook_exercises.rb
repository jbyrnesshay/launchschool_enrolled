#1, #2, 
array = [1,2,3,4,5,6,7,8,9,10]
array.each do |variable|
  puts variable if variable > 5
end

#3

puts array.select {|num| num.odd? }

#4
p array.push(11).unshift(0)

#5
puts 
puts
array.pop
array.push(3)
p array

 
#6
array.uniq!
p array

#7

#an array is a numerically indexed ordered collection
#a hash is a collection of key/value pairs

#8
hash1 = {a: 'dog', b: 'cat', c: 'frog'}
hash2 = {:a => 'kitten', "b" => 'puppy', [4] => 'frogpup'}

#9
h = {a:1, b:2, c:3, d:4}
#9.1
p h[:b]
#9.2
h[:e] = 5
#9.3
h.delete_if {|_,v| v < 3.5}
p h


#10
#hash values can be arrays
hash1 = {:dog => ['wooof', 'paws', 'dopey']}
#can hae array of hashes
array1 = [{:cat => ['meow', 'crazy']}, {:frog => ['green', 'brown', 'yellow', 'bad choice']}]
p hash1
p array1

#11 skip

#12
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
 
p contacts

#13

p contacts["Joe Smith"][:email] 

#14
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]

contacts = {"Joe Smith" => {}}
attributes = [:email, :address, :phone]

 
  attributes.each do |attribute|
    contacts["Joe Smith"][attribute] = contact_data.shift
  end
puts 'this thing'
puts contacts

#15
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if {|h| h.start_with?('s')}
p arr

#16
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a.map! do |l|
  l.split
end
a.flatten!
p a

# extra

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
attributes = [:email, :address, :phone]
contacts.each do |contact, values|
  attributes.each do |attribute|
    values[attribute] = contact_data.first.first
    contact_data.first.shift
  end
  contact_data.shift
end
puts 'this thing here'
p contacts












































