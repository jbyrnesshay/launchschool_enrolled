
# colors.rb contains functions for colorizing some commandline output
require_relative 'colors.rb'

# key is winning term when opponent term is value for key
WIN_TERMS = {
  rock: ['lizard', 'scissors'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['scissors', 'rock'],
  lizard: ['spock', 'paper']
}
# value for key is used in display and validate to indicate valid keypresses
VALID_CHOICES = {
  rock: 'r',
  paper: 'p',
  scissors: 'sc',
  spock: 'sp',
  lizard: 'l'
}

user_choice = ''
# keep track of user vs computer wins
wins = { user: 0, computer: 0 }

# welcome display keeps display of score (# of wins) between matches,
# display is colorized using methods in colors.rb

def welcome(wins)
  <<~MSG
  *****  #{colorize(string: 'Welcome to Rock, Paper, Scissors, Spock, Lizard!', color: 'white', bkgrnd: 'bg-blue')} *****
  *****  #{colorize(string: 'Current Score:', color: 'white')}  #{colorize(string: 'YOU', color: 'white', bkgrnd: 'bg-magenta', bold: 1)}  vs  #{colorize(string: 'COMPUTER', color: 'white', bkgrnd: 'bg-magenta', bold: 1)}  *******************
  *****                  #{colorize(string: " #{wins[:user]} ", color: 'white', bkgrnd: 'bg-cyan', bold: 1)}      #{colorize(string: " #{wins[:computer]} ", color: 'white', bkgrnd: 'bg-cyan')}
  *****  Game on!  Make your selection now  *******************
MSG
end

# increment wins hash value for key when won match
def increment_wins(player, computer, wins)
  if winner?(player, computer)
    wins[:user] += 1
  elsif winner?(computer, player)
    wins[:computer] += 1
  end
end

def winner?(player1, player2)
  WIN_TERMS[player1.to_sym].include?(player2)
end

# grand winner when score increases to 5 wins
def grand_winner(wins)
  wins.key(5)
end

def result_message(player, computer)
  if winner?(player, computer)
    'You won!'
  elsif winner?(computer, player)
    'Computer won!'
  else
    'Its a tie!'
  end
end

# constructs text display of choices to reflect keypress option for choice
# choices appear in display as '..., [p]aper, [sc]issors, [sp]ock, ...'
def display_choices
  display = []
  VALID_CHOICES.each do |key, val|
    display << "[#{val}]#{key.to_s.slice(val.length, key.length)}"
  end
  display
end

# check if user 1 or 2 keystroke matches valid chars for valid selections
def validate_user_selection(input)
  VALID_CHOICES.each do |option, value|
    # test allows strings longer than valid keystrokes
    # requires start of input string is valid keystroke/strokes
    # strips leading or trailing spaces
    return option.to_s if input.downcase.strip.index(value.to_s) == 0
  end
  false
end

def clear_terminal
  system('cls')
  system('clear')
end

def prompt(message)
  puts("=> #{message}")
end

# uses colorize function in colors.rb to color winning celebration banner
def print_banner(winner)
  colors = ['bg-magenta', 'bg-cyan', 'bg-red', 'bg-blue', 'bg-red', 'bg-gray']
  winner = winner.capitalize
  headline = "********* GRAND WINNER!  #{winner} won 5 matches! *********"

  puts "********************************************************"
  puts "********************************************************"
  5.times do
    puts colorize(string: headline, color: 'default', bkgrnd: colors.sample)
  end
  puts "********************************************************"
  puts "********************************************************"
  puts
end

# main program logic
clear_terminal
loop do
  puts welcome(wins)
  loop do
    prompt("Choose one: #{display_choices.join(', ')}")
    input = gets.chomp
    user_choice = validate_user_selection(input)
    break if user_choice
    puts
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.keys.sample.to_s
  puts
  prompt "You chose '#{user_choice}'"
  prompt "Computer chose '#{computer_choice}'"
  puts
  prompt result_message(user_choice, computer_choice).upcase

  increment_wins(user_choice, computer_choice, wins)
  match_winner = grand_winner(wins)

  if match_winner
    clear_terminal
    print_banner(match_winner)
    break
  end
  puts
  prompt("Do you want to play again? ('y' or 'n')")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
  clear_terminal
end

prompt('Thank you for playing rock, paper, scissors, spock, lizard')
