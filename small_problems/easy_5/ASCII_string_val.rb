






def ascii_value(string)
  string.each_char.inject(0) {|sum, char| sum += char.ord }
end








p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

#what is the mystery method such that char.ord.mystery == char ??
# chr, i.e. 103.chr == 'g'
# i.e. 'g'.ord.chr == 'g'
# with a longer string such as 
# 'ginda'.ord.chr == 'g'
# only uses value of the first char