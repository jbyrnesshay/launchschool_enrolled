#Practice Problem 10

#Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#odify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below
=begin
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
=end
#Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.


 
#https://stackoverflow.com/questions/5114584/how-to-use-ruby-case-when-with-inequalities
Inf = 1.0/0.0
munsters.each do |key, values|
  age = values['age']
  age_group = case age
  when 65..Inf
    'senior'
  when 18..64
    'adult'
  when 0..17
    'kid'
  end
  values["age_group"] = age_group
end

puts munsters.inspect

#or 
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_, values|
  age = values['age']
  age_group = if age >= 65
    'senior'
  elsif age >= 18 && age <= 64
    'adult'
  elsif age >= 0 && age <= 17
    'kid'
  end
  values['age_group'] = age_group
end



puts munsters

#or
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  age = details['age']
  age_group = case age
    when 0...18
      'kid'
    when 18...65
      'adult'
    else 
      'senior'
    end
  details['age_group'] = age_group
end

puts munsters