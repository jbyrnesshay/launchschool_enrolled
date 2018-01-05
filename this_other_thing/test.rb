def valid_parentheses(string)
 paren = string.scan(/[()]/)
 p paren
 return false if (paren.count.odd? || paren.first == ')')
 n = 0
 left = 0
  loop do 
    match = paren.join.match(/\(+/).to_s
    match_size = match.size
    test = $'
    if test.slice(0,match_size) != match
      return false
    end
    paren
 end
end