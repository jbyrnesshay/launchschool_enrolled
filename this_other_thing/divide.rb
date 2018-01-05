

def divide(number, divisor)
  begin
    answer = number / divisor
    puts answer
  rescue ZeroDivisionError => e  
    puts e.message
  end
end


divide(5, 0)