







=begin

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
=end
BLOCKS = [['B','O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'], ['G','T'],
   ['R','E'], ['F','S'], ['J','W'], ['H','U'], ['V','I'], ['L','Y'], ['Z','M']].freeze

def block_word?(word)
  input = word.upcase
  #p test_word
  BLOCKS.each { |x,y| return false if (input.include?(x) && input.include?(y))}
  true
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('zipga') == true
p block_word?('pact') == false




#alternative


BLOCKS = %w(BO, XK, DQ, CP, NA, GT, RE, FS, JW, HU, VI, LY, ZM)

def block_word2?(word)
  word = word.upcase
  # ensuret that no block is used more than once, as 
  # well as that two letters from a block are not used
  BLOCKS.none? {|block| block.count(word) >= 2 }
end
p block_word2?('BATCH') == true
p block_word2?('BUTCH') == false
p block_word2?('jest') == true
p block_word2?('zipga') == true
p block_word2?('pact') == false