
require 'pry'
def swap(string)
  words = string.split(' ')
  words.each do |word|
    swap = word[-1]
    word[-1] = word[0]
    word[0] = swap
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

def word_swap_take2(string)
  first = string.slice!(0)
  last = string.slice!(-1)
  string.prepend(last) if last
  string.insert(-1, first)
end

def swap_take2(string)
  result = string.split.map do |word|
    word_swap_take2(word)
  end
  result.join(' ')
end
p swap_take2('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap_take2('Abcde') == 'ebcdA'
p swap_take2('a') == 'a'

def swap_take3(string)
  #words = string.scan(/\w+/)
  result = string.split.map do |word|
    letters = word.split('')
    last = letters.pop
    first = letters.shift
    letters.unshift(last)
    letters.push(first)
    letters = letters.join
    letters
 end
 #p result
 result = result.join(' ')
end

p swap_take3('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap_take3('Abcde') == 'ebcdA'
p swap_take3('a') == 'a'

def swap_take4(string)
  words = string.split()
  words.map! do |word|
    core = word.slice!(1..-2)
    if word.size > 1
      "#{word[1]}#{core}#{word[0]}" 
    else word
    end 
  end
  words.join(' ')
end
 

p swap_take4('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap_take4('Abcde') == 'ebcdA'
p swap_take4('a') == 'a'

def swap_take5(string)
  result = string.split.map! do |word|
    first_last_char(word)
  end
  result.join(' ')
end
def first_last_char(word)
  word[0],word[-1] = word[-1],word[0]
  word
end

p swap_take5('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap_take5('Abcde') == 'ebcdA'
p swap_take5('a') == 'a'