require 'pry'

# rubocop:disable Metrics/LineLength
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
# rubocop:enable Metrics/LineLengths
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "cls"
  system "clear"
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
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
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # binding.pry
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  # binding.pry
  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end
=begin
def detect_winner(brd)
  WINNING_LINES.any? do |line|
    if line.all? { |square| brd[square] == PLAYER_MARKER }
      return "player"
    elsif line.all? { |square| brd[square] == COMPUTER_MARKER }
      return "computer"
    end
  end
  nil
end
=end


def detect_winner(brd)
    WINNING_LINES.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 3
        return "player"
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        return "computer"
      end
=begin
      if brd[line[0]] == PLAYER_MARKER &&
        brd[line[1]] == PLAYER_MARKER &&
        brd[line[2]] == PLAYER_MARKER
        return "player"
      elsif brd[line[0]] == COMPUTER_MARKER &&
        brd[line[1]] == COMPUTER_MARKER &&
        brd[line[2]] == COMPUTER_MARKER
        return "computer"
      end
=end
    end
    nil
end
 

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

loop do
  board = initialize_board
  display_board(board)
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    # binding.pry
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)
  # puts board.inspect
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
  prompt "play again? y/n"
  answer = gets
  break unless answer.downcase.start_with?('y')
end

prompt "thanks for playin'"
