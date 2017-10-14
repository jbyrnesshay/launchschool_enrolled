VALID_CHOICES = ['rock', 'paper', 'scissors']

=begin
def display_results(choice, computer_choice)
  if (choice == 'rock' && computer_choice == 'scissors') ||
    (choice == 'paper' && computer_choice == 'rock') ||
    (choice == 'scissors' && computer_choice == 'paper')
    prompt("you won")
  elsif (choice == 'rock' && computer_choice == 'paper') ||
    (choice == 'paper' && computer_choice == 'scissors') ||
    (choice == 'scissors' && computer_choice == 'rock')
    prompt("Computer won!")
  else
    prompt("Its a tie!")
  end
end
=end
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
