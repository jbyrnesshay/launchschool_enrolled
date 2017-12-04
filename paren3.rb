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
p balanced?('is (funny(sometimes)) but it is not good(at all (at least not yet))') == true
p balanced?('(this thing) is (funny((sometimes))) but it is not good(at all (at least not yet))') == true

