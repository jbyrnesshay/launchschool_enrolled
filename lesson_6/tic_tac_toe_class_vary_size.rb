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

# initialize board to be custom size
def initialize_board(size)
  new_board = {}
  squared_size = size * size
  (1..squared_size).each {|num| new_board[num] = INITIAL_MARKER }#INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  # binding.pry
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

BOARD_SIZE = 5

# auxilliary to create some divider lines for structure of board
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

# finds all winning line combinations regardless of board size
def find_winning_lines(size)
  across = []
  down = []
  diagonal = []
  all_values = []
  all = size * size
  (1..all).each do |value|
      all_values << value
  end

  # across winning lines
  start_slice = 0
  size.times do 
    across << all_values.slice(start_slice, size)
    start_slice += size
  end

  # down winning lines
  size.times do |vertical_index|
    storage = []
    size.times do |factor|
      storage.push(all_values.at(vertical_index + (size * factor)))
    end
    down << storage
  end

  # diagonal winning lines
  [0,all_values.at((all_values.size - 1) - size)].each do |corner_index|
    storage = []
    size.times do |factor|
      if corner_index == 0
        size_vectorized = size
      else size_vectorized  = size * (-1)
      end
      storage.push(all_values.at(corner_index +(size_vectorized*factor) + factor))
    end
    diagonal << storage
  end

  across + down + diagonal
end
 
p find_winning_lines(BOARD_SIZE)

# create complete board display structure, custom size
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

#board = initialize_board(BOARD_SIZE)




NUM_COMP_PLAYERS = 4
player_hash = {}
def create_player_values(num, hash)
  num.times do |x|
    player_name = "computer" 
    hash[player_name] = 'O'
    if x > 0
        player_name << (x + 1).to_s
        hash[player_name] = ('P'..'Z').to_a.sample 
    end
  end
  hash
end 

players = create_player_values(NUM_COMP_PLAYERS, player_hash)

 
def display_board(display_it, wins, players)
  system "cls"
  system "clear"
  player_indentification_message = ''
  players.map {|key, value| player_indentification_message << "#{key} is #{value}.  " }
  puts "You're a #{PLAYER_MARKER}. #{player_indentification_message}"
  wins_message = ''
  wins.map {|player, value| wins_message  << "#{player} has #{wins[player]} wins.  " }
  puts "You have #{wins["player"]} wins.  #{wins_message}"
  puts ""
  puts display_it
  puts ""
end


def initialize_wins(win_counts)
  win_counts.each {|agent, _| win_counts[agent] = 0}
end

win_counts = {"player"=> 0, "ties"=> 0}
def merge_player_wins(players, hash)
  keys = players.keys
  keys.each do |key|
    hash[key] = 0
  end
end

merge_player_wins(players, win_counts)

p win_counts
p players
 
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
 


def detect_winner(brd)
    WINNING_LINES.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 3
        return "player"
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        return "computer"
      end
    end
    nil
end


def increment_wins(counts, winner)
 counts[winner] += 1
end

def select_computer(brd, players)
  computers = players.keys
end

def computer_places_piece!(brd, player)
  computers = players.keys
  square = ''
  computers.each do |player|
    if player != 'player'
       
      WINNING_LINES.each do |line|
        square = find_at_risk_square(line, brd, COMPUTER_MARKER)
        break if square
        square = find_at_risk_square(line, brd, PLAYER_MARKER)
        break if square
      end
    end
    #binding.pry
  end
  if !square
    count_lines = BOARD_SIZE
    if count_lines.odd?
      x = (count_lines / 2 + 1) * BOARD_SIZE - (BOARD_SIZE/2)
      #INITIAL_MARKER
      square = x
    else square = empty_squares(brd).sample
    end
  end
  brd[square] = COMPUTER_MARKER
end
 

def find_at_risk_square(line, board, marker)
 
  if board.values_at(*line).count(marker) == 2
    #binding.pry
    z= board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  
  else
    nil
  end
end
 
 

def completed_round?(board)
  someone_won?(board) || board_full?(board)
end

def place_piece!(brd, current_player, players)
  if current_player == 'player'
    player_places_piece!(brd) 
  else
    computer_places_piece!(brd, players)
  end
end

def next_player(current_player, players)
  player_names = players.keys.sort
  if current_player == 'player' 
    current_player = 'computer'
  else #'bill', 'ahh', 'aaaf'
    player_names.each do |named|
      if named == current_player
        next 
      else current_player = named
      end
      #break
    end
  end
  current_player
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
      board = initialize_board(BOARD_SIZE)
      display_the_board = board_structure(BOARD_SIZE, board)
      #p first_play
    loop do
       display_the_board = board_structure(BOARD_SIZE, board)
      display_board(display_the_board, win_counts, players)
      break if completed_round?(board)
 
      place_piece!(board, player, players)
      binding.pry
      player = next_player(player, players)
        
      end
  
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