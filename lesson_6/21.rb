require 'pry'

def initialize_deck
	deck = []
	suits = ['H', 'D', 'C', 'S']
	values = ('2'..'10').to_a + ['Jack','King','Queen','Ace']
	values.each do |value|
		suits.each do |suit|
			card = []
			card.push(suit, value)
			deck << card
		end
	end
	deck
end

def prompt(message)
	puts "=> #{message}"
end

def deal_cards(deck)
	hand = []
	2.times do 
		hand << deck.sample
	end
	deck_delete(hand, deck)
	hand
end

def deck_delete(hand, deck)
	hand.each do |card|
		#deck.keep_if {|value| value != card}
		deck.delete(card)
	end
end

def hit(deck, hand)
	hand << deck.sample
	deck_delete(hand, deck)
	hand
end		

def describe_hand(hand, player, reveal = false)
	values = []
	hand.each do |x|
				if values.empty? || player == 'player' || reveal == true
						values << x[1]
				elsif player == 'dealer'
					values << 'unknown card'
				end
	end
	thing = values.join(' and ')
end

 
def adjust_ace_value(values, total)
	if total > 21
		values.each do |value|
			total -= 10 if value == 'A'
			break if total <= 21
		end
	end
	total
end
def sum_hand(hand)
	
    values = hand.map {|card| card[1]}
    total = values.reduce(0) do |sum, card|
	   if card.to_i.to_s == card.to_s
			sum += card.to_i
		elsif card.start_with?('A')
		    sum += 11
		else 
			sum += 10
		end
	end
	adjust_ace_value(values, total)
end

def bust?(hand)
	sum_hand(hand) > 21
end

def winner?(hand)

end

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

#deck_delete(hand, deck)

# fix this, shouldn't be this
def winner(dealer, player)
  if sum_hand(dealer) == sum_hand(player)
  	nil
  elsif bust?(player)
  	'dealer'
  elsif bust?(dealer)
  	'player'
  elsif sum_hand(dealer) > sum_hand(player)
  	'dealer'
  else 'player'
  end
end

deck = initialize_deck
dealer_hand = deal_cards(deck)
player_hand = deal_cards(deck)
# refactor this stuff and sort out bust and win and loops and stuff
 
	prompt "Dealer has: #{describe_hand(dealer_hand, 'dealer')}"
	prompt "You have: #{describe_hand(player_hand, 'player')}"
	prompt "your score is #{sum_hand(player_hand)}"
	prompt "Your turn:"
	loop do 
			prompt "hit or stay?"
			answer = gets.chomp
			break if answer == 'stay'
			hit(deck, player_hand)
			break if bust?(player_hand)
			prompt "You have: #{describe_hand(player_hand, 'player')}"
			prompt "your score is #{sum_hand(player_hand)}"
	end
	puts;puts
	if bust?(player_hand) 
		prompt "You have: #{describe_hand(player_hand, 'player')}"
					prompt "your score is #{sum_hand(player_hand)}"
		p 'player busted'
	elsif !bust?(player_hand)
		prompt "Dealer's turn"
		dealer_move(deck, dealer_hand)
		prompt "Dealer has: #{describe_hand(dealer_hand, 'dealer')}"
		prompt "dealer score is  #{sum_hand(dealer_hand)}"
		if bust?(dealer_hand) 
			p 'dealer busted'
			sleep(1)
		end
		puts;puts
		prompt "You have: #{describe_hand(player_hand, 'player')}"
		prompt "your score is #{sum_hand(player_hand)}"
		
	end
winner = winner(dealer_hand, player_hand)
sleep(1)
if winner
		puts "BLACKJACK!!!!"
		puts 'winner is ' + winner
		puts "dealer's hand held the following cards:"
		puts " #{describe_hand(dealer_hand, 'dealer', true)} for a score of #{sum_hand(dealer_hand)}"
		puts "your hand held the following cards:"
		puts " #{describe_hand(player_hand, 'player')} for a score of #{sum_hand(player_hand)}"
else p 'its a tie' 
end




=begin
p deck
puts;puts
p hand
hit(deck, hand)
p deck
p hand
p describe_hand(hand, 'player')
puts;puts
p sum_hand(hand)
 
=end

