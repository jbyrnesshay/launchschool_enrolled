def count_wins(player, computer, wins)
  if winner?(player, computer)
    wins[:you] += 1
  elsif winner?(computer, player)
    wins[:computer] += 1
  end
end

def winner?(player1, player2)
  VALID_CHOICES[player1.to_sym].include?(player2)
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


def prompt(message)
  puts("=> #{message}")
end


def user_selection(options, test)
  input = test
  options.each do |option, value|
    return option.to_s if input.index(value.to_s) == 0 
  end
  false
end

#display choices uses the return of selection_input to display the created selection hash
def display_choices(selections)
  display = []
  selections.each do |y, z|
    thing = "[#{z.to_s}]#{y.to_s.slice(z.length, y.length)}"
    display << thing
  end
  display
end

def selection_input(keys)
  selections = Hash.new  
  #}rock
  VALID_CHOICES.keys.each do |x|
    count = 0
    VALID_CHOICES.keys.each do |y|
        if x.to_s[0] == y.to_s[0]
          count += 1
        end
    end
    if count > 1
        selections[x] = x.to_s.slice(0, count)
    else 
      selections[x] = x.to_s.slice(0,1)
    end
  end
 selections
end  