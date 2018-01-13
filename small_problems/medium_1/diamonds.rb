



#working method
def diamond(num)
  start = num / 2
  num.times do |x|
    puts (' ' * start.abs) + '*' * (num - 2*start.abs)
    start -= 1
  end
end

diamond(15)
diamond(9)
diamond(19)
diamond(7)
diamond(3)


#try an alternative method

=begin
def diamond(num)
  line = Array.new(num) {|i| ' '}
  num.times do |x|
  end

end

=end