
require 'pry'
require_relative 'h.rb'



wins = { you: 0, computer: 0 }
VALID_CHOICES = {rock: ['lizard', 'scissors'], paper:['rock', 'spock'], scissors:['paper', 'lizard'], spock:['scissors', 'rock'], lizard:['spock', 'paper'] }

choice = ''


selections = selection_input(VALID_CHOICES.keys)
display = display_choices(selections)


loop do
  loop do
    prompt("Choose one: #{display.join(', ')}")
    test = gets.chomp
    choice = user_selection(selections, test)

    break if choice
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.keys.sample.to_s
  puts "You chose #{choice}. Computer chose #{computer_choice}"
  puts result_message(choice, computer_choice)

  count_wins(choice, computer_choice, wins)
  match_winner = grand_winner(wins)
  if match_winner
    puts "Grand Winner! #{match_winner} won 5 times!"
    break
  end

  prompt("do you want to play again? ('y' or 'n')")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

prompt('thank you for playing rock, paper, scissors')
