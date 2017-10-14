
WINNER = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['paper', 'spock'],
  spock: ['scissors', 'rock']
}

wins = {player: 0, computer: 0}

def define_valid_choices
  my_hash = Hash.new
VALID_CHOICES = WINNER.keys.map do |key|
  if key[0] == 'scissors' || key[0] == 'spock'
    my_hash.add(key.to_s:"[#{key[0] + key[1]}]#{key[2..last]}")
  else 
    #the method is probably not add, look it up
    my_hash.add(key.to_s:"[#{key[0]}]#{key[1..last]}")
end

def valid_selection(input)
  first = input.chars[0]
  second = input.chars[1]
  contain = VALID_CHOICES.select do |choice|
    if choice.match(/^#{first}/) && choice.match(/^\w{1}#{second}/)
      return input.replace(choice)
    end
  end
  false
end[]

def win?(first, second)
  WINNER[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("you won")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("Its a tie!")
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
    # if VALID_CHOICES.include?(choice)
    if valid_selection(choice)
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
puts "thanks for playing rock paper scissors lizard spock"
