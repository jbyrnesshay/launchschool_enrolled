#Given this nested Hash:
#figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#DONE 5 WAYS

#method 1
ages = 0
munsters.each do |key, value|
  if value['gender'] == 'male'
    ages += value['age'] 
  end
end
puts ages

#method 2
test = munsters.sum do |k, v|
   v['gender']=='male' ? v['age'] : 0
end
puts test
 
# method 3
test2 = munsters.inject(0) do |sum, (k, v)|
  # sum is an accumulator
    v['gender']=='male' ? sum + v['age'] : sum
end
puts test2

#test 4
#this is not the way to go, because unless (k,v) is passed as method 3, hash1 as below is passedin as array
test2 = munsters.inject(0) do |sum, hash1|
  hash1[1]['gender'] == 'male' ? sum + hash1[1]['age'] : sum
end
puts test2

#method 5
#the guy wants to use each_value
male_ages = 0
test3 = munsters.each_value do |munster|
   male_ages += munster['age'] if munster['gender'] == 'male'
end
puts male_ages
