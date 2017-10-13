
def winner?(player1, player2)
  VALID_CHOICES[player1.to_sym].include?(player2)
end

wins = { you: 0, computer: 0 }
VALID_CHOICES = {rock: ['lizard', 'scissors'], paper:['rock', 'spock'], scissors:['paper', 'lizard'], spock:['scissors', 'rock'], lizard:['spock', 'paper'] }


def count_wins(player, computer, wins)
  if winner?(player, computer)
    wins[:you] += 1
  elsif winner?(computer, player)
    wins[:computer] += 1
  end
end

def grand_winner(wins)
  wins.key(5)
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

def user_selection(options)
  input = gets.chomp
  #keys = VALID_CHOICES.keys
  #options = selection_input(keys)
  options.each do |option|
    return option.to_s if input > option.to_s
  end
  false
end
=begin
  SET storage-array
  for an array of values
    iterate through values
    SET test = current value
      iterate through copy of array of values
      compare test indices to indices of each new value
      count test[index] == new_value[index]
      when != stop
        << new string
        next new_value
       SET string = slice 0, count
       storage-array << string



=end

def selection_input(keys)
  selections = [] #rock
  VALID_CHOICES.keys.each do |x|
    count = 0
    VALID_CHOICES.keys.each do |y|
      length = 0
      puts y.to_s.length
      while length < y.to_s.length
        if x.to_s[count] == y.to_s[count]
        #if x.to_s[0] == y.to_s[0]
          length += 1
        end
      end
    end
    if count > 0
        selections << x.to_s.slice(0, length)
    else 
      selections << x.to_s.slice(0, 1)
    end
  end
 selections
end  

choice = ''

=begin
def display_choices
  display = []
  
  VALID_CHOICES.keys.to_s.each do |x|
    count = 0
    VALID_CHOICES.keys.to_s.each_with_index do |y, index|
      if x[index] == y[index]
        count += 1
      else
        count -=1
      end
    end
    if count > 0
      display << "[ #{x.slice(0, count)}] #{x.slice(count, length - 1)}"
    else display << "[ #{x.slice(0)} ] #{x.slice(1, length - 1)}"
    end
  end
end
=end

def display_choices(selections)
  display = []
  VALID_CHOICES.keys.each_with_index do |y, index|
    thing = selections[index].to_s + y.to_s.slice(selections[index].length - 1, y.length - 1)
    display << thing
  end
  display
end
selections = selection_input(VALID_CHOICES.keys)
puts selections.inspect
exit
display = display_choices(selections)

loop do
  loop do
    #prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}")
    prompt("Choose one: #{display.join(', ')}")
    choice = user_selection(selections)
    # break if VALID_CHOICES.include?(choice.to_sym)
    break if choice
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.keys.sample.to_s
  puts choice.inspect
  puts computer_choice.inspect
  puts computer_choice.class
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
