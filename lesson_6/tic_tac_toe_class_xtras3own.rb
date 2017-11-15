 require 'pry'

# rubocop:disable Metrics/LineLength
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
# rubocop:enable Metrics/LineLengths
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
#FIRST_MOVE_ORDER = {'player'=>['player', 'computer'], 'computer'=>['computer', 'player']}
FIRST_PLAYER = 'choose'

def prompt(msg)
  puts "=> #{msg}"
end
# BOARD_SIZE_OPTIONS = [3,5]
def initialize_board(size)
  new_board = {}
  squared_size = size * size
  (1..squared_size).each {|num| new_board[num] = 'x' }#INITIAL_MARKER}
  new_board
end

BOARD_SIZE = 5
def create_board_line(size, value = "blank")
  value == "blank" ? cell = "     " : cell = "-----"
  value == "blank" ? divider = "|" : divider = "+"
  line = ''
  (1..size).each do |x|
     endcell = x % size != 0 ? divider : "\n"
     line << cell  + endcell
  end
  line
end

def board_structure(size, brd)
  structure_cells = []
  size_squared = size * size
  basic_structure = ''
  divider = "|"
  (1..size_squared).each do |x| 
      
      basic_structure << "  #{brd[x]}  "
      if x % size == 0
        ending = "\n"
      else ending = ""
      end
      basic_structure << divider unless x % size == 0 
      basic_structure << ending
      basic_structure 
  end
  #thing = structure
  #puts thing.each_line.count
  complete_structure = ''
  basic_structure.each_line.with_index do |line, x|
      complete_structure << create_board_line(size)
      complete_structure << line
      complete_structure << create_board_line(size)
      unless basic_structure.each_line.count == x + 1
        complete_structure << create_board_line(size, "filled")
      end
  end
  complete_structure 
end
board = initialize_board(BOARD_SIZE)
puts board_structure(BOARD_SIZE, board)
exit
# rubocop:disable Metrics/AbcSize
def display_board(brd, wins)
  system "cls"
  system "clear"
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "You have #{wins["player"]} wins.  Computer has #{wins["computer"]} wins.  There are #{wins["ties"]} ties"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
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
    array.join(delimit)
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

win_counts = {"player"=> 0, "computer"=> 0, "ties"=> 0}

def increment_wins(counts, winner)
 counts[winner] += 1
end

def computer_places_piece!(brd)
  square = ''
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    else square = empty_squares(brd).sample
    end
  end
  brd[square] = COMPUTER_MARKER
end
 

def find_at_risk_square(line, board, marker)
  #if board.values_at(*line).count(COMPUTER_MARKER) == 2
   # b= board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    #binding.pry
    #b
  if board.values_at(*line).count(marker) == 2
    #binding.pry
    z= board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    #binding.pry
   #@ z
  else
    nil
  end
end
 
 

def completed_round?(board)
  someone_won?(board) || board_full?(board)
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd) 
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

loop do
  system "cls"
  initialize_wins(win_counts)
  first_play = if FIRST_PLAYER == 'choose'
                      prompt 'who goes first? "player" or "computer"'
                      choice = gets.chomp
                      player = choice
                    else player = FIRST_PLAYER
                    end
  loop do 
      board = initialize_board
  
      #p first_play
    loop do
      display_board(board, win_counts)
      break if completed_round?(board)
      #first_play.each do |agent|
        #binding.pry
      # player_places_piece!(board)
       # unless completed_round?(board)
        #  move(agent, board)
         # display_board(board, win_counts)
      #  end
        place_piece!(board, player)
        player = alternate_player(player)
        
      end
      #break if completed_round?(board)
      #computer_places_piece!(board)
      #sleep(1)
     # break if someone_won?(board) || board_full?(board)
     #end
    #display_board(board, win_counts)
     #sleep(1)
    # puts board.inspect
    if someone_won?(board)
      winner = detect_winner(board)
      #binding.pry
      count = increment_wins(win_counts, winner)
      prompt "#{detect_winner(board)} won!"
      prompt "#{winner} has #{count} wins"
      
    else
      prompt "It's a tie!"
      #binding.pry
      win_counts["ties"] += 1
    end
    sleep(2)
    break if count == 5
  end
  prompt "play again? y/n"
  answer = gets
  break unless answer.downcase.start_with?('y')
end

prompt "thanks for playin'"