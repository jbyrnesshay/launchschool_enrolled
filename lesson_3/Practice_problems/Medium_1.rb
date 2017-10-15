

#10.times {|x| puts " "*x + "The Flintstones Rock!"}


#question 3
=begin
def factors(number)
  return 'invalid number: must be > 0' if number <= 0
  dividend = number
  divisors = []
  loop do 
     divisors << number / dividend if number % dividend == 0
     dividend -= 1
     break if dividend == 0
  end
  divisors
end

puts factors(6).inspect
=end

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
     divisors << number / dividend if number % dividend == 0
     dividend -= 1
  end
  divisors
end

puts factors(-5).inspect

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  puts buffer.object_id
  buffer.shift if buffer.size > max_buffer_size
  puts buffer.inspect
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  puts buffer.object_id
  buffer.shift if buffer.size > max_buffer_size
  #puts buffer.inspect
  buffer
end
buffer = [4,2,100,45, 87,34]
puts buffer.object_id.to_s + 'is id'
rolling_buffer1(buffer, 15, 200)
rolling_buffer1(buffer, 15, 201)
rolling_buffer1(buffer, 15, 202)
rolling_buffer1(buffer, 15, 203)
rolling_buffer1(buffer, 15, 204)
rolling_buffer1(buffer, 15, 205)
rolling_buffer1(buffer, 15, 206)
rolling_buffer1(buffer, 15, 207)
rolling_buffer1(buffer, 15, 208)
rolling_buffer1(buffer, 15, 209)
puts 'buffer is' + buffer.inspect
puts 'test2'
puts
buffer = [4,2,100,45, 87,34]
puts rolling_buffer2(buffer, 15, 200).inspect
puts rolling_buffer2(buffer, 15, 201).inspect
puts rolling_buffer2(buffer, 15, 202).inspect
rolling_buffer2(buffer, 15, 203)
rolling_buffer2(buffer, 15, 204)
rolling_buffer2(buffer, 15, 205)
rolling_buffer2(buffer, 15, 206)
rolling_buffer2(buffer, 15, 207)
rolling_buffer2(buffer, 15, 208)
rolling_buffer2(buffer, 15, 209)

