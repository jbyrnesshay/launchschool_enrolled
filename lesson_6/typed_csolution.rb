require 'pry'

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
WINNING_VALUE = 21
DEALER_STAY_AT = 17

winner = nil
wins = { player: 0, dealer: 0 }


def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', 'J'], ['S', '4'], etc]
  values = cards.map { |card| card[1] }
  
  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0 # J, K, Q
      sum += 10
    else
      sum += value.to_i
    end
  end

  # cprrect fpr Aces
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > WINNING_VALUE
  end
  sum
end

def busted?(cards_total)
  cards_total > WINNING_VALUE
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_total, player_total)
  
  if player_total > WINNING_VALUE
    :player_busted
  elsif dealer_total > WINNING_VALUE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! dealer wins"
  when :dealer_busted
    prompt "Dealer busted! you win"
  when :player
    prompt "you win!"
  when :dealer
    prompt "Dealer wins"
  when :tie
    prompt "its a tie!"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (Y or N)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def grand_output(dealer_cards, player_cards)
  dealer_total = total(dealer_cards)
  player_total = total(player_cards)
  puts "======================"
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "======================"
end




loop do
  prompt "Welcome to Twenty - One!"

 
  # initialize vars
  player_total = 0
  dealer_total = 0
  


 
  #exit
  loop do

  
   deck = initialize_deck
  # initial deal
 player_cards = []
  dealer_cards = []
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
  #binding.pry
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "Dealer has #{dealer_cards[0]} and ? "
  prompt "You have #{player_cards[0]} and #{player_cards[1]} for a total of #{player_total}"
  # binding.pry
  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      # binding.pry
      player_cards << deck.pop
      # binding.pry
      player_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_total)
  end

  if busted?(player_total)
    grand_output(dealer_cards, player_cards)
    display_result(dealer_total, player_total)
    #p 'here' + wins[:dealer].to_s
    #play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer_turn
  prompt "Dealer turn..."

  loop do
    break if dealer_total >= DEALER_STAY_AT

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_total)
    prompt "Dealer total is now: #{dealer_total}"
    grand_output(dealer_cards, player_cards)
    #p wins
    #p wins[:player]
    display_result(dealer_total, player_total)

    #wins[:player] += 1
    #play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  grand_output(dealer_cards, player_cards)

  display_result(dealer_total, player_total)
  winner = detect_result(dealer_total, player_total)
  p 'here'
  p winner
  winner == :player_busted || winner == :dealer ? wins[:dealer] += 1 : wins[:player] += 1
  #p winner
  #p wins[winner]
  p wins
  # break unless play_again?
  #play_again? ? next : break

  break if wins.values.include? 5
end
  
  break unless play_again? == 'y'
end
winner = wins.key(5).to_s
puts "winner is #{winner}"
prompt "Thank you for playing Twenty One! Good bye"
