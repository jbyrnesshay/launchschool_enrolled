# Write a method that takes one argument, a string,
# and returns the same string with the words in reverse order.

def reverse_sentence(string)
  # str_arr = string.split(' ')
  # str_arr.reverse!.join(' ')
  string.split.reverse.join(' ')
end

thing = 'is this a good one'
puts reverse_sentence(thing)
