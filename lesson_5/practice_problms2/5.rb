#Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#figure out the total age of just the male members of the family.

 

total = 0
keys = munsters.keys
keys.each do |munster|
	if munsters[munster]['gender'] == 'male'
		total += munsters[munster]['age']
	end
end

p total

#alternate v
result = munsters.inject(0) do |accum, obj|
	hash = [obj].to_h
    gender = hash.values[0]['gender']
    age = hash.values[0]['age']
=begin
    accum +=
	if hash.values[0]['gender'] == 'male'
		hash.values[0]['age']
	else 0
    end
=end
    accum += (gender == 'male' ? age : 0)

end

p result

#alternate
thing = munsters.map do |key, values|
	#total |= 0
	#p values
	#p key
	values['gender'] == 'male' ? values['age'] : 0
end
p thing.sum

#alternate
total4 = 0
munsters.each do |k,v|
	total4 += (v['gender'] == 'male' ? v['age'] : 0)
end
p total4

#alternate
total5 = 0
munsters.each_value do |v|
	total5 += v['age'] if v['gender'] == 'male'
end
p total5