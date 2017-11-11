require 'pry'

INITIAL_MARKER = ' ' 
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  puts "" 
  puts "     |     |" 
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts 
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  #binding.pry
  brd.keys.select{|num| brd[num] == INITIAL_MARKER}
end
def player_places_piece!(brd)
  square = ''
  loop do#{{
        prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  #binding.pry
  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end
def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end


def winning_squares?(brd, player)
  winning_values = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
   win = winning_values.select do |value|
      brd.keys.select {|num| brd[num] == player} & value == value
   end
   win.any?
end

def winner(brd)
  winner = nil
    if winning_squares?(brd, PLAYER_MARKER)
      winner = "player"
    elsif winning_squares?(brd, COMPUTER_MARKER)
    winner = "computer"
    end
  #end
  winner
end

board = initialize_board
loop do 
  display_board(board)
  winner_status = winner(board)
  if winner_status
    puts "the winner is #{winner_status}"
    break
  elsif board_full?(board)
    puts "its a tie~"
    break
  end
  player_places_piece!(board) 
  computer_places_piece!(board)
  puts board.inspect
  
  
end
#display_board(board)