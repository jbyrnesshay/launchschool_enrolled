VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING = {'rock': ['scissors','lizard'], 'paper': ['rock', 'spock'], 'scissors': ['paper', 'lizard'], 'lizard': ['paper', 'spock'], 'spock': ['scissors', 'rock']}

=begin
def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') 
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
end
=end
def valid_choice(choice)
  if WINNING.include?(choice.to)
    puts "good choice"
  end
end
def display_results(player, computer)
  #if WINNING.values_at(player.to_sym).include?(computer)
  if WINNING[player.to_sym].include?(computer)
    prompt("you won")
  #elsif WINNING.values_at(computer.to_sym).include?(player)
  elsif WINNING[computer.to_sym].include?(player)
    prompt("Computer won!")
  else
    prompt("Its a tie!")
  end
end
=begin
def display_results(choice, computer_choice)
  index_user_choice = VALID_CHOICES.index(choice)
  if VALID_CHOICES[index_user_choice - 1] == computer_choice
    prompt("you won")
  elsif choice == computer_choice
    prompt("its a tie")
  else
    prompt("computer won!")
  end
end
=end

def prompt(message)
  Kernel.puts("=> #{message}")
end
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}: ")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end
  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}.  Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("do you want to play again (y or n)?")
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase().start_with?('y')
end
puts "thanks for playing rock paper scissors"
