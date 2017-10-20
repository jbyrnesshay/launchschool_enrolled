


def double_numbers(numbers)
  doubled_numbers = []
  counter = 0
  loop do    
    break if counter == numbers.size
    current_number = numbers[counter]
    doubled_numbers << current_number * 2
    counter += 1
  end
  doubled_numbers
end

#puts double_numbers([5,4,2,3]).inspect


def double_numbers!(numbers)
  counter = 0
  loop do    
    break if counter == numbers.size
    numbers[counter] *= 2
    counter += 1
  end
  numbers
end

#puts double_numbers!([4,9,22,51]).inspect

def double_odd_numbers(numbers)
  counter = 0
  doubled_odd = []
  loop do     
    break if counter == numbers.size
    current_number = numbers[counter]
    if current_number.odd? 
     current_number *= 2
    end
    doubled_odd << current_number
    counter += 1
  end
  doubled_odd
end

set = [50, 45, 26,105, 900, 2501, 4507]
#puts double_odd_numbers(set).inspect


def double_odd_index(numbers)
  counter = 0
  doubled_index_odd = []
  loop do   
    break if counter == numbers.size
    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_index_odd << current_number
    counter += 1
  end
  doubled_index_odd
end

#puts double_odd_index(set).inspect
#puts set.inspect

produce = {potato: 'vegetable', tomato: 'vegetable', apple: 'fruit', celery: 'vegetable', turkey: 'meat', grape: 'fruit', plum: 'fruit', broccoli: 'vegetable', kiwi: 'fruit'}
criterion = 'meat'

def general_select(collection, criterion)
  counter = 0
  collection_keys = collection.keys   
  selected = {}
  loop do    
    break if counter == collection.size
    key = collection_keys[counter]
    value = collection[key]
    if value == criterion
      #item = [[key, value]].to_h
      #selected.merge!(item)
      selected[key] = value
    end
    counter += 1
  end
  selected
end

#puts general_select(produce, criterion)


def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0
  loop do  
    break if counter == numbers.size
    current_number = numbers[counter]
    multiplied_numbers << current_number * multiplier
    counter += 1
  end
  multiplied_numbers
end

# numbos = [499, 45, 527, 1001, 24, 87]
# puts multiply(numbos, 5).inspect

question = 'How many times does a particular character appear in this sentence?'

def select_letter(sentence, character)
  selected_letter = []
  counter = 0
  loop do
    break if counter == sentence.length
    current_char = sentence[counter]
    selected_letter << current_char if current_char == character
    counter += 1
  end
  selected_letter
end

#puts select_letter(question, 'e').inspect

def count_char(sentence, character)
  select_letter(sentence, character).size
end

#puts count_char(question, 'e')




alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end