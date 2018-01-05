

myfile = File.open('med.txt', 'r') {|file| File.read(file)}


#myfile = File.open('pg84.txt' , 'r') {|file| File.read(file)}

sentences = myfile.split(/[.!?]/)
WORD_REG = /[^\s\.\!\?]+/

def find_longest_sentence(sentences)
  sentences.max_by { |x| num_words_in_sentence(x) }
end

def num_words_in_sentence(sentence)
  sentence.scan(/#{WORD_REG}/).count
end

longest_sentence = find_longest_sentence(sentences)
#p longest_sentence
#p num_words_in_sentence(longest_sentence)



#alternative version

myfile = File.open('med.txt', 'r') {|file| File.read(file)}

sentences = myfile.split(/\.|\?|\!/)


def find_longest_sentence(sentences)
  sentences.max_by { |sentence| num_words_in_sentence(sentence)}
end

def num_words_in_sentence(sentence)
  sentence.split.count
end

longest_sentence = find_longest_sentence(sentences)
p longest_sentence
p num_words_in_sentence(longest_sentence)
puts;puts;puts
p longest_sentence.split(/\s/)

puts
p longest_sentence.split
p longest_sentence

paragraphs = myfile.split(/\n\n+(Chapter\s\d+)*\n\n*/)
puts;puts; puts "paragraphs"
p paragraphs.count


paragraphs.each do |para|
  puts para.inspect
end
#puts;puts;puts
#puts myfile.inspect


