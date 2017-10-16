

question 2
sno implicit conversion of Integer into String
+ using 2 different class types
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{(40 + 2)}"


question 3
Bonus 1

What is the purpose of the number % dividend == 0 ?
the modulus is used to determine if dividend divides into number without any remainder (i.e., it is a whole number)

Bonus 2

What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
this ensures the return value of the method is "divisors"

question 4
buffer is re-assigned to different location in memory '='
rolling_buffer2 never adds to the buffer itself, but only to the method's local buffer
rolling_buffer1 effectively alters the input argument, buffer2 does not

question 7
34

question 8
yes because []= is a method which mutates the caller

question 9 
"paper"
question 10 
"no"
