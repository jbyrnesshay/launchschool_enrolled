

myfile = File.open('med.txt', 'r') {|file| File.read(file)}


#myfile = File.open('pg84.txt' , 'r') {|file| File.read(file)}

sentences = myfile.split(/[.!?]/)
WORD_REG = /[^\s\.\!\?]+/

def longest_sentence(sentences)
  sentences.max_by do |x| 
    num_words_in_sentence(x)
  end
end

def num_words_in_sentence(sentence)
  sentence.scan(/#{WORD_REG}/).count
end

p longest_sentence(sentences)
p num_words_in_sentence(longest_sentence(sentences))