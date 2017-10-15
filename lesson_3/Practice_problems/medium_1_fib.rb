limit = 65

def fib(first_num, second_num, limit)
  thing = []
  thing << first_num
    thing << second_num
  while second_num < limit
  
    sum = first_num + second_num
    first_num = sum

    second_num = sum + second_num
      thing << first_num
    thing << second_num
    
  end
  puts thing.inspect
  puts second_num
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"