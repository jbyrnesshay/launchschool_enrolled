
=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: 
one represents the percentage of characters in the string that are lowercase letters, 
one the percentage of characters that are uppercase letters, and 
one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples
=end




def letter_percentages(string) 
  upperc_percent = (string.count('A-Z') / string.size.to_f * 100).divmod(1).sum {|v| v.to_i == v ? v.to_i : v}
  lowerc_percent = (string.count('a-z') / string.size.to_f * 100).divmod(1).sum {|v| v.to_i == v ? v.to_i : v}
  other_percent = (string.count('^A-Za-z') / string.size.to_f * 100).divmod(1).sum {|v| v.to_i == v ? v.to_i : v}
  #p self
{lowercase: lowerc_percent, uppercase: upperc_percent, neither: other_percent }
end

#count_to_percent
p letter_percentages('abCdef 123') 
#== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

 


#alternate version, mine
def letter_percentages2(str)
 vals = {lowercase: 'a-z', uppercase: 'A-Z', neither: '^A-Za-z' }
 vals.each { |k,v| vals[k] = (str.count(v) / str.size.to_f * 100).divmod(1).sum {|v| v.to_i == v ? v.to_i : v } }
  #this is overkill and is only to figure out how I would handle places if I were displaying values
  # i do not  need .. the divmod stuff if I am only getting and testing the proper values which evaluate as equivalent 
 vals
end

p letter_percentages2('abCdef 123') 
#== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages2('AbCd +Ef') 
#== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages2('123') == { lowercase: 0, uppercase: 0, neither: 100 }



#alternate, class solution
def letter_percentage_class(str)
  counts = {lowercase: 0, uppercase: 0, neither: 0}
  percentages = {lowercase: [], uppercase: [], neither: []}
  counts[:uppercase] = str.count('A-Z')  
  counts[:lowercase] = str.count('a-z') 
  counts[:neither] = str.count('^A-Za-z')  
  counts.keys.each {|x| percentages[x] = counts[x] / str.size.to_f * 100}
  percentages
end 

p letter_percentage_class('abCdef 123') 


#altrnate, class solution, verboseway

def letter_percentage_class2(str)
  counts = {lowercase: 0, uppercase: 0, neither:0}
  percentages = {lowercase: [], uppercase: 0, neither: []}
  length = str.size
  counts[:uppercase] = str.count('A-Z')
  counts[:lowercase] = str.count('a-z')
  counts[:neither] = str.count('^A-Za-z')
  calculate(percentages, counts, length)
  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = counts[:uppercase] / length.to_f * 100
  percentages[:lowercase] = counts[:lowercase] / length.to_f * 100
  percentages[:neither] = counts[:neither] / length.to_f * 100
end

p letter_percentage_class2('abCdef 123')