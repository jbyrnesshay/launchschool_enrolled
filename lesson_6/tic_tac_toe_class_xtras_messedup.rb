require 'pry'

# rubocop:disable Metrics/LineLength
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
# rubocop:enable Metrics/LineLengths

# remaining constants
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_MOVE_ORDER = {'player'=>['player', 'computer'], 'computer'=>['computer', 'player']}
FIRST_PLAYER = 'player'


# moethods

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

win_counts = {"player"=> 0, "computer"=> 0}

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
  #binding.pry
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
  if board.values_at(*line).count(marker) == 2
    #binding.pry
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    #binding.pry
   #@ z
  else
    nil
  end
end
 
def move(current_player, brd)
 # binding.pry
  if current_player == 'player'
    player_places_piece!(brd) 
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

# main program
 
loop do
    initialize_wins(win_counts)
    
      loop do # game round loop
            choice = ''
            if FIRST_PLAYER == 'choose'
                            loop do
                              prompt 'choose "player" or "computer"'
                              choice = gets.chomp
                              break if choice == 'player' || choice == 'computer'
                              prompt 'please enter a valid choice'
                            end
              first_play = FIRST_MOVE_ORDER[choice]
            else first_play = FIRST_MOVE_ORDER[FIRST_PLAYER]
            end
            #p first_play
            ##display_board(board, win_counts)
            board = initialize_board
            display_board(board, win_counts)
            #until someone_won?(board) || board_full?(board)
            loop do
              first_play.each do |agent|
                # binding.pry
                # player_places_piece!(board)
                
                move(agent, board)
                display_board(board, win_counts)
                sleep(1)
                break if someone_won?(board) || board_full?(board)
                
                
              end
              break if someone_won?(board) || board_full?(board)
            end  
                   # puts board.inspect
            if someone_won?(board)
                winner = detect_winner(board)
                #binding.pry
                count = increment_wins(win_counts, winner)
                prompt "#{detect_winner(board)} won!"
                prompt "#{winner} has #{count} wins"
            elsif board_full?(board)
                prompt "It's a tie!"
            end
            sleep(0.4)
            break if count == 5
         
      end #end game round loop
    prompt "play again? y/n"
    answer = gets
    break unless answer.downcase.start_with?('y')

end

#end game initializization loop
prompt "thanks for playin'"
