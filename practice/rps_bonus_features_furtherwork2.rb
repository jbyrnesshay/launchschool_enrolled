
WINNER = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['paper', 'spock'],
  spock: ['scissors', 'rock']
}
work = WINNER

def reset
  wins = {player: 0, computer: 0}
end

wins = reset
 

VALID_CHOICES = WINNER.keys.map(&:to_s)

def display_choices(choices)
  display = choices.map do |key|
    length = key.length - 1
     if (key == 'scissors' || key == 'spock')
      "[#{key[0]}#{key[1]}]#{key[2..length]}"
     else
        
      "[#{key[0]}]#{key[1..length]}"
     end
  end
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
end

def win?(first, second)
  WINNER[first.to_sym].include?(second)
end

def tally_results(player, computer, wins)
  if win?(player, computer)
    wins[:player] += 1
  elsif win?(computer, player)
    wins[:computer] += 1
  end
end

def grand_winner(wins)
  if wins.has_value?(5)
    wins.key(5)
  end
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
    #prompt("Choose one: #{VALID_CHOICES.join(', ')}: ")
      prompt("Choose one: #{display_choices(VALID_CHOICES).join(', ')}: ")
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
  tally_results(choice, computer_choice, wins)
  winner = grand_winner(wins)
  if winner
    puts "Grand Winner!  #{winner} won 5 times !"
    wins = reset
  else
    puts("current score is YOU = #{wins[:player]} vs COMPUTER = #{wins[:computer]}")
  end
  prompt("do you want to play again (y or n)?")
  play_again = Kernel.gets().chomp()

  break unless play_again.downcase().start_with?('y')
end

puts "thanks for playing rock paper scissors lizard spock"
