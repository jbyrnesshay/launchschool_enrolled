
def when_retire(age_now, age_retirement)
  age_retirement.to_i - age_now.to_i
end



print "What is your age?  "
age = gets.chomp
print "At what age would you like to retire?  "
retirement_age = gets.chomp

current_year = Time.now.year
 
to_retirement = when_retire(age, retirement_age)
retirement_year = current_year + to_retirement
puts "It's #{current_year}.  YOu will retire in #{retirement_year}"