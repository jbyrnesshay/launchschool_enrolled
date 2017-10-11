
range = 1..99

def odd(range)
  range.each do |num|
    puts num if num.odd?
  end
end

#odd(range)


1.upto(99) do |num|
  puts num if num % 2 == 1
end