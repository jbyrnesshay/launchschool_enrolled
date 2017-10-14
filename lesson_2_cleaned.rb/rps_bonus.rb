
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
# value for key is used in display to indicate valid keypresses
VALID_CHOICES = {
  rock: 'r',
  paper: 'p',
  scissors: 'sc',
  spock: 'sp',
  lizard: 'l'
}

user_choice = ''
# keep track of user vs computer wins
wins = { User: 0, Computer: 0 }

# a welcome display, also keeps display of score *# of wins) between matches,
# display is colorized using methods in colors.rb
def welcome(wins)
  <<MSG

*****  #{colorize('Welcome to Rock, Paper, Scissors, Spock, Lizard!', 'white', 'bg-blue')} *****
*****  #{colorize('Current Score:', 'white')}  #{colorize('YOU', 'white', 'bg-magenta', 1)}  vs  #{colorize('COMPUTER', 'white', 'bg-magenta', 1)}  *******************
*****                  #{colorize(" #{wins[:User]} ", 'white', 'bg-cyan', 1)}      #{colorize(" #{wins[:Computer]} ", 'white', 'bg-cyan')}
*****  Game on!  Make your selection now  *******************

MSG
end

# increment wins hash value for key when won match
def count_wins(player, computer, wins)
  if winner?(player, computer)
    wins[:User] += 1
  elsif winner?(computer, player)
    wins[:Computer] += 1
  end
end

def winner?(player1, player2)
  WIN_TERMS[player1.to_sym].include?(player2)
end

# grand winner when score increases to 5 wins
def grand_winner?(wins)
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

# create text display of choices to reflect keypress option for choice
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
    return option.to_s if input.index(value.to_s) == 0
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

# uses colorize function in colors.rb to color winning banner
def print_banner(winner)
  colors = ['bg-magenta', 'bg-cyan', 'bg-red', 'bg-blue', 'bg-red', 'bg-gray']
  headline = "********* GRAND WINNER!  #{winner} won 5 matches! *********"

  puts "********************************************************"
  puts "********************************************************"
  5.times do
    puts colorize(headline, 'default', colors.sample)
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

  count_wins(user_choice, computer_choice, wins)
  match_winner = grand_winner?(wins)

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

prompt('Thank you for playing rock, paper, scissors')
