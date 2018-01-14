


def featured(num)
  
  while true
    num = ((num / 7) * 7) + 7
    test = num.to_s.split('')
    err = 'there is no possible number that fulfills those requirements' if num.to_s.size > 10
    break if err || (test.length == test.uniq.length) && num.odd? #&& num%7 == 0)
  end
  result = err ? err : num
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)
