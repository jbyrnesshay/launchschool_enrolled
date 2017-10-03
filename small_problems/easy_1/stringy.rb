def stringy(num, flag = 1)
  string = ''
  num.times do |index|
    if flag == 1
      index.even? ? string << '1' : string << '0'
    else
      index.even? ? string << '0' : string << '1'
    end
  end
  string
end

puts stringy(9) == '101010101'
puts stringy(9)