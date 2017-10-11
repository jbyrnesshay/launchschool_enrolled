
def tip(bill, rate)
  format("%.2f", (bill.to_f * rate.to_f/100))
end


puts "what is the bill?"
bill = gets.chomp

puts "what is the tip percentage?"
rate = gets.chomp

tip = tip(bill, rate)
total = format("%.2f", (tip.to_f + bill.to_f))
puts "The tip is $#{tip}"
puts "The total is $#{total}"

