
def teddys_age
  rand(20..200)
end



puts "Teddy's age is #{teddys_age()} years old!"


def age_with_name(name)
  name = 'Teddy' if name.empty?
  "#{name}'s age is #{rand(20..200)} years old"
end

puts "give me a name of a person to find out their age: "
person_name = gets.chomp

puts age_with_name(person_name)