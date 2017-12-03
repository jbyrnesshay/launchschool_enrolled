






def balanced?(string)
  # string =~ /\(.*?\)/
  #parens = string.match(/\(.*?\)/)
  parens = string.scan(/[\(\)]/).join
  unmatched = []
  #p parens
  #parens =~ string.scan(/\(.*?\)/)
  index, length = 0,0
  1.upto(parens.size) do |x|
    #left_paren = parens.slice(index,1)
    p parens
    left_paren = parens.match(/\(*/)
    length = left_paren.to_s.size
    left = parens.slice(index,length)
    #p length
    #p parens.slice(length, length)
    test = parens.slice(length, length).match(/\)*/)  
    unmatched << left_paren.to_s.delete('(' * test.size + test.to_s) if parens.slice(length, length) != (')' * length)
    parens.slice!(index, length*2)
    index += length * 2
    
  end
  p unmatched
  true
end
 #((((())))()))
=begin
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
=end
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') 
#== false
#(())()))
##p balanced?('Hey!') == true
#p balanced?(')Hey!(') == false
#p balanced?('What ((is))) up(') == false
 

=begin
p balanced?('is (funny(sometimes)) but it is not good(at all (at least not yet))')
p balanced?('(this thing) is (funny((sometimes))) but it is not good(at all (at least not yet))')
p balanced?('((What)) (is this))?')
p balanced?('((What) (is this))?')
=end