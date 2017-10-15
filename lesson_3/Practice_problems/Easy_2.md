question 1
ages.include?("Spot")
ages.has_key?("Spot")
ages.key?("Spot")
ages.member?("Spot")

questions 2
munsters.capitalize!
munsters.swapcase!
munsters.downcase!
munsters.upcase!

question 3
ages.merge!(additional_ages)

question 4
advice.include?("Dino")
advice.match(/Dino/)

question 5
%w(Fred Barney Wilma Betty BamBam Pebbles)

question 6
flintstones.push("Dino")
flintstones << "Dino"

question 7 
flintstones.push("Dino", "Hoppy")
flintstones.concat(["Dino", "Hoppy"])

question 8
advice.slice(/house.*/) slices off everything starting from house
advice.slice!(/.*(?=house.*)/) slices off everything up to house, returns the sliced off string
advice.slice(0, advice.index("house"))

question 9
statement.count('t')

question 10
title.center(40)
