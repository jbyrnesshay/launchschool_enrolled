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
def display_board(brd, wins)
  system "cls"
  system "clear"
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "You have #{wins["player"]} wins.  Computer has #{wins["computer"]} wins"
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

=begin
def joinor(array:, delimit: ',', junction: 'or')
  string = ''
  size = array.size
  array.each_with_index do |value, i|
    item = if i == (size - 2)
             "#{value}#{delimit} #{junction} "
           elsif i == size -1
             "#{value}"
           else
             "#{value}#{delimit} "
           end
    string << item
  end
  string
end
=end
def joinor(array:, delimit: ', ', junction: 'or')
  size = array.size
  case size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{junction} ")
  else
    array[-1] = "#{junction} #{array[-1]}"
    array.join("#{delimit}")
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    # prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    prompt "Choose a square: #{joinor(array: empty_squares(brd))}"
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

def initialize_wins(win_counts)
  win_counts.each {|agent, _| win_counts[agent] = 0}
end
win_counts = {"player"=> 0, "computer"=> 0}

def increment_wins(counts, winner)
 counts[winner] += 1
end
def computer_places_piece!(brd)
  square = ''
  if immediate_threat(brd, COMPUTER_MARKER)
     square = immediate_threat(brd, COMPUTER_MARKER)
     puts square.to_s + ' comp'
  elsif immediate_threat(brd, PLAYER_MARKER)
     square = immediate_threat(brd, PLAYER_MARKER)
     puts square.to_s + ' player'
  elsif brd[5] == INITIAL_MARKER
     square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end


def immediate_threat(brd, marker)
  threat = ''
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2  && 
      brd.values_at(*line).count(INITIAL_MARKER) == 1
      square = brd.values_at(*line).index(INITIAL_MARKER)  
      return line[square]
    end
  end
  nil
end

loop do
  initialize_wins(win_counts)
  
  
  loop do 
  board = initialize_board
  display_board(board, win_counts)
    loop do
      display_board(board, win_counts)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      #threat_type = immediate_threat(board)
      computer_places_piece!(board)
      #binding.pry
      #puts immediate_threat(board)
      sleep(1)
      break if someone_won?(board) || board_full?(board)
     end
    display_board(board, win_counts)
     #sleep(1)
    # puts board.inspect
    if someone_won?(board)
      winner = detect_winner(board)
      #binding.pry
      count = increment_wins(win_counts, winner)
      prompt "#{detect_winner(board)} won!"
      prompt "#{winner} has #{count} wins"
      sleep(2)
    else
      prompt "It's a tie!"
    end
    break if count == 5
  end
  prompt "play again? y/n"
  answer = gets
  break unless answer.downcase.start_with?('y')
end

prompt "thanks for playin'"
