
#Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

#You may assume that words are any sequence of non-blank character





def word_cap(string)
  #string.split.map {|word| word.capitalize}.join(' ')
   string.split.map(&:capitalize).join(' ')
end
p word_cap('four score and seven')
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'



#alternate without capitalize method

def word_cap2(string)
  string.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end

p word_cap2('four score and seven')
p word_cap2('four score and seven') == 'Four Score And Seven'
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'

#alternate3

def word_cap3(string)
  string.split.map do |word|
    
    if (97..122).include? word[0].ord 
      then word[0] = (word[0].ord - 32).chr 
    end
    word[1..-1] = word[1..-1].chars.map! do |char|
     if (65..90).cover? char.ord
       (char.ord + 32).chr
     else char 
     end
    end.join()
     
    word[0] + word[1..-1]
  end.join(' ')
end

puts 'word3'

p word_cap3('the javaSCript language')
p word_cap3('four score and seven')
p word_cap3('four score and seven') == 'Four Score And Seven'
p word_cap3('the javaScript language')
p word_cap3('the javaScript language') == 'The Javascript Language'
p word_cap3('this is a "quoted" wOrd') == 'This Is A "quoted" Word'
puts word_cap3('this is a "quoted" wOrD')