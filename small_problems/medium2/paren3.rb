


def balanced?(string)
  parens = string.scan(/[\(\)]*/).join
  loop { break if parens.gsub!('()', '').nil? }
  parens.size.zero?
end

=begin
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('is (funny(sometimes)) but it is not good(at all (at least not yet))') == true
p balanced?('(this thing) is (funny((sometimes))) but it is not good(at all (at least not yet))') == true

=end

# expanding for single, double quotes
def expand_balanced?(string)
  pairs_unmatched = string.scan(/[\(\)\'\"\{\}\[\]]*/).join
  loop { break if pairs_unmatched.gsub!(/(\(\))|(\[\])|(\{\})|(\'\')|(\"\")/, '').nil? }
  pairs_unmatched.size.zero?
end

#p expand_balanced?('What "(is)" th[is]?') 




# class solution

def test_quote(char, quotes)
   quotes << char
   p quotes
   p quotes.size
   if quotes.size == 1 || quotes.first != quotes.last
    1
   else
    -1
   end
end

#still working on this advanced option to handle single and double quotes properly

def balance_class?(string)
  unmatch = 0
  tester = [['[',']'],['{','}'],['(',')']]
  quotes = []
  string.each_char.with_index do |char, index|
    if char == "'" || char == "\""
        unmatch += test_quote(char, quotes)
    elsif tester.each do |x,y|
      char == x ? unmatch += 1 : char == y ? unmatch -= 1 : nil
      end
    end
    break if unmatch < 0
  end
  unmatch
end
p balance_class?("'What (is) ['th]is?") 
