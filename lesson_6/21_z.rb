require 'pry'

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  deck = []
  suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  values = ('2'..'10').to_a + ['Jack', 'King', 'Queen', 'Ace']
  values.each do |value|
    suits.each do |suit|
      card = []
      card.push(suit, value)
      deck << card
    end
  end
  deck
end

=begin
#alternate
def initialize_deck
	deck = {}
	
	suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
	values = ('2'..'10').to_a + ['Jack','King','Queen','Ace']
	suits.each do |suit|
		value_arr = []
		values.each do |value|
			value_arr << value
		end
		deck[suit] = value_arr
	end
	deck
end
p deck = initialize_deck
exit
=end
def draw_card(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def deal_cards(deck)
  hand = []
  2.times { hand << draw_card(deck) }
  hand
end

def hit(deck, hand)
  hand << draw_card(deck)
end
 
def adjust_ace_value(values, total)
		values.each do |value|
			total -= 10 if value == 'A'
			break if total <= 21
		end
	  total
end

def sum_hand(hand)
  total = hand.reduce(0) do |sum, card|
		if card[1].to_i.to_s == card[1].to_s
			sum += card[1].to_i 
		elsif card[0].start_with?('A')
	    sum += 11
		else 
			sum += 10
		end
	end
	adjust_ace_value(hand, total) if total > 21
	total
end

def bust?(hand)
	sum_hand(hand) > 21
end



# review stay, dealer_move, and describe_hand for necessity, complexity, and appropriateness of side effects
def stay(hand)
	prompt "dealer stays"
	return hand
end

def dealer_move(deck, hand)
	loop do 
		return stay(hand) if sum_hand(hand) >= 17
		hit(deck, hand)
		prompt 'dealer hits'
		sleep(1)
  end 
end

def describe_hand(hand, player, reveal = false)
	values = []
	unknowns = 0
	hand.each do |x|
		if values.empty? || player == 'player' || reveal == true
			suit =  x[0]
			values << "#{x[1]} of #{suit} "
		elsif player == 'dealer'
			unknowns += 1
			ending = (unknowns > 1) ? 's' : ''
			values[1] = "#{unknowns} UNKNOWN card" + ending
		end
	end
	values
end

def higher_score(player_hand_to_test, player_hand_to_compare)
	sum_hand(player_hand_to_test) > sum_hand(player_hand_to_compare) if !bust?(player_hand_to_test)
end

def player_won?(player_hand_to_test, player_hand_to_compare)
   higher_score(player_hand_to_test, player_hand_to_compare) || bust?(player_hand_to_compare) 
end
 
def winner(dealer_hand, player_hand)
  return 'dealer' if player_won?(dealer_hand, player_hand)
  return 'player' if player_won?(player_hand, dealer_hand)
  nil
end

def who_busted?(dealer_hand, player_hand)
	if bust?(dealer_hand) 
		'dealer'
	elsif bust?(player_hand)
		'player'
	else nil
	end
end

def winning_reason(dealer_hand, player_hand)
	busted_player = who_busted?(dealer_hand, player_hand)
	return "#{busted_player.upcase} busted!" if busted_player
	"#{winner(dealer_hand, player_hand)} had higher score"
end
   
 

def neat_card_display(described_hand)
	described_hand.each do |card|
			cells = Array.new(27, ' ')
			cells.fill("*", 0, 3)
			card.split('').each_with_index do |x, k|
				start = k + 6
				cells.fill(x, start, 1) 
			 end
			cells.fill("*", 25,3)
			cells.each {|cell| print cell}
			puts
			#puts "***  #{card}   ***"
	end
end



# gameplay
loop do 
	deck = initialize_deck
	dealer_hand = deal_cards(deck)
	player_hand = deal_cards(deck)
	# refactor this stuff and sort out bust and win and loops and stuff
	loop do 
		system 'clear'
		prompt"  Dealer has "
		describe_dealer_hand = describe_hand(dealer_hand, 'dealer')
		neat_card_display(describe_dealer_hand)
		puts
		prompt"  YOU have: "
		describe_player_hand = describe_hand(player_hand, 'player')
		neat_card_display(describe_player_hand)
		puts
		prompt "your score is #{sum_hand(player_hand)}"
		prompt "Your turn:"
		prompt "hit or stay?"
		answer = gets.chomp
		break if answer == 'stay'
		hit(deck, player_hand)
		break if bust?(player_hand)		
	end
	puts;puts
	if bust?(player_hand) 
		system 'clear'
		prompt "You have: "
		describe_player_hand = describe_hand(player_hand, 'player')
		neat_card_display(describe_player_hand)
		prompt "your score is #{sum_hand(player_hand)}"
		prompt 'PLAYER busted'
	else
		system 'clear'
		prompt "Dealer's turn"
		dealer_move(deck, dealer_hand)
		describe_dealer_hand = describe_hand(dealer_hand, 'dealer')
		neat_card_display(describe_dealer_hand)
		 
		prompt "DEALER score is  #{sum_hand(dealer_hand)}"
		sleep(1)
		if bust?(dealer_hand) 
			p 'dealer busted'
			sleep(0.5)
		end	
	end
	winner = winner(dealer_hand, player_hand)
	sleep(2)
	system 'clear'
	if winner
		  puts "BLACKJACK!!!!"
			puts "winner is #{winner}".upcase
			puts "Because: #{winning_reason(dealer_hand, player_hand)}"
			puts
			loser = winner != 'player' ? 'player': 'dealer'
			winning_label = winner == 'player' ? 'your' : "#{winner}'s"
			winning_hand = winner == 'player' ? player_hand : dealer_hand
			losing_label = winner != 'player' ? 'your' : "dealer's"
			losing_hand = winner != 'player' ? player_hand : dealer_hand
			winning_hand_to_display = describe_hand(winning_hand, winner, true)
			losing_hand_to_display = describe_hand(losing_hand, loser, true)
			prompt "#{winning_label.upcase} winning hand held the following cards:"
			puts "** SCORE = #{sum_hand(winning_hand)}"
			neat_card_display(winning_hand_to_display)
			#puts "#{describe_hand(dealer_hand, 'dealer', true)} 
			puts
			prompt "#{losing_label.upcase} losing hand held the following cards:"
			puts "** SCORE = #{sum_hand(losing_hand)}"
			neat_card_display(losing_hand_to_display) 
	else
			puts "its a tie!"
			puts
			prompt "Player's hand held the following cards:"
			puts "** SCORE = #{sum_hand(player_hand)}"
			neat_card_display(describe_hand(player_hand, 'player'))
			puts
			prompt "Dealer's hand held the following cards:"
			puts "** SCORE = #{sum_hand(dealer_hand)}"
			neat_card_display(describe_hand(dealer_hand, 'dealer', true))
	end
	puts
	prompt "play again?".upcase
	answer = gets.chomp
	break if !answer.downcase.start_with?('y')
end
prompt "thanks for playing"
 

