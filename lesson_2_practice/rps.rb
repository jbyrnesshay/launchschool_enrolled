
def winner?(player1, player2)
  (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'paper' && player2 == 'rock') ||
    (player1 == 'scissors' && player2 == 'paper')
end

def result_message(player, computer)
  if winner?(player, computer)
    'You won'
  elsif winner?(computer, player)
    'Computer won'
  else
    'its a tie'
  end
end

def test_method
  prompt('test message')
end

def prompt(message)
  puts("=> #{message}")
end

test_method

VALID_CHOICES = %w(rock paper scissors).freeze
choice = ''

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.sample

  puts "You choice #{choice}. Computer chose #{computer_choice}"
  puts result_message(choice, computer_choice)

  prompt("do you want to play again? ('y' or 'n')")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

prompt('thank you for playing rock, paper, scissors')
