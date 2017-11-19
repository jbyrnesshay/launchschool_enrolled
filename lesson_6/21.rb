require 'pry'

def prompt(message)
	puts "=> #{message}"
end

def initialize_deck
	deck = []
	suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
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
	#p hand
	values = hand #hand.map {|card| card[1]}
   
    total = values.reduce(0) do |sum, card|
      
	  	if card[1].to_i.to_s == card[1].to_s
			sum += card[1].to_i
		elsif card[0].start_with?('A')
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
					values[1] = "#{unknowns} unknown card" + ending
				end
	end
	#p values
	values
end

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


def neat_card_display(described_hand)

	described_hand.each do |card|
			cells = Array.new(25, ' ')
			cells.fill("*", 0, 3)
			card.split('').each_with_index do |x, k|
				start = k + 6
				cells.fill(x, start, 1) 
			 end
			cells.fill("*", 23,3)
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
			#prompt "Dealer has: #{describe_hand(dealer_hand, 'dealer')}"
			prompt"  Dealer has "
			#p dealer_hand
			describe_dealer_hand = describe_hand(dealer_hand, 'dealer')
			neat_card_display(describe_dealer_hand)
			puts
			prompt"  YOU have: "
			describe_player_hand = describe_hand(player_hand, 'player')
			neat_card_display(describe_player_hand)
			puts
			#prompt "#{describe_hand(player_hand, 'player')}"
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
			p 'player busted'
		elsif !bust?(player_hand)
			system 'clear'
			prompt "Dealer's turn"
			dealer_move(deck, dealer_hand)
			describe_dealer_hand = describe_hand(dealer_hand, 'dealer')
			neat_card_display(describe_dealer_hand)
			 
			prompt "dealer score is  #{sum_hand(dealer_hand)}"
			sleep(1)
			if bust?(dealer_hand) 
				p 'dealer busted'
				sleep(0.5)
			end
=begin
			puts;puts
			prompt "You have: #{describe_hand(player_hand, 'player')}"
			prompt "your score is #{sum_hand(player_hand)}"
=end			
		end
	winner = winner(dealer_hand, player_hand)
	sleep(2)
	if winner
		  system 'clear'
			puts "BLACKJACK!!!!"
			puts 'winner is ' + winner
			puts "dealer's hand held the following cards:"
			puts "SCORE = #{sum_hand(dealer_hand)}"
			dealer_hand_to_display = describe_hand(dealer_hand, 'dealer')
			neat_card_display(dealer_hand_to_display)
			#puts "#{describe_hand(dealer_hand, 'dealer', true)} 
			puts "dealer score is #{sum_hand(dealer_hand)}"
			puts
			puts "your hand held the following cards:"
			puts "SCORE = #{sum_hand(player_hand)}"
			player_hand_to_display = describe_hand(player_hand, 'player')
			neat_card_display(player_hand_to_display)
			 
	else p 'its a tie' 
	end
	prompt "play again?"
	answer = gets.chomp
	break if !answer.downcase.start_with?('y')
end
prompt "thanks for playing"


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

