flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# turn this array into a hash where the names are the keys and the values are the positions in the array.

def convert!(array)
	my_hash = {}

flintstones.each_with_index |item, index|
  my_hash[item] = index 
end
end


	