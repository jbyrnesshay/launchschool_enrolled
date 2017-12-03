def balanced?(string)
  parens = string.scan(/[\(\)]*/).join
  loop { break if parens.gsub!('()', '').nil? }
  parens.size.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false

