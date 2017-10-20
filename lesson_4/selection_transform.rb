=begin
Let's now take a look at an example with hashes. In this example we want to select the key-value pairs where the value is 'Fruit'.

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

How would you implement a method like this?
=end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# without array
 
def select_fruit(produce)
  produce.select {|key, value| value == 'Fruit'}
end
  
#puts select_fruit(produce).inspect
puts
#puts produce



#with keys as array
def select_fruit2(produce)
  keys = produce.keys
  counter = 0
  new_hash = {}
  loop do
      key = keys[counter]
      if produce[key] == 'Vegetable'
        new_hash[key] = produce[key]
      end
      counter += 1
      break if counter == keys.size
  end
  new_hash
end

puts select_fruit2(produce)