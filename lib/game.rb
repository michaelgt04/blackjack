class Game

  attr_reader :player_hand, :player_choice
  attr_accessor :dealer_hand

  def initialize
      @deck = Deck.new
      @player_hand = Hand.new(@deck.deal(2))
      @dealer_hand = Hand.new(@deck.deal(2))
      @player_hand.display_hand("Player")
      @dealer_hand.display_hand("Dealer")
  end

  def player_choice_display
    puts "Do you want to hit or stand? (h/s)"
    @player_choice = gets.chomp.downcase
  end

  def player_hand_validator
    player_choice_display
    until @player_choice == "h" || @player_choice == "s"
      player_choice_display
    end
  end

  def hit_stand
    player_hand_validator
    while @player_choice == "h"
      puts "You drew a #{@deck.hit(@player_hand)}\n\n"
      @player_hand.display_hand("Player")
      if @player_hand.bust?
          puts "You busted! The dealer wins...\n\n"
          quit_check
      else
        player_choice_display
      end
    end
      puts "Player stands.\n\n"
      puts "Dealer has: #{@dealer_hand.dealt_cards[0].display} #{@dealer_hand.dealt_cards[1].display}\n\n"
  end

  def dealer_hit_stand
    while @dealer_hand.under_17?
      puts "The dealer drew a #{@deck.hit(@dealer_hand)}"
    end
    if dealer_hand.bust?
      puts "The dealer has gone bust! You win!"
      quit_check
    else
      puts "The dealer stands with a score of #{dealer_hand.hand_value}.\n\n"
    end
  end

  def winner
    if @player_hand.hand_value > @dealer_hand.hand_value
      puts "You win! You had a score of #{@player_hand.hand_value} and the dealer only had #{@dealer_hand.hand_value}."
    elsif @player_hand.hand_value == @dealer_hand.hand_value
      puts "You tied with the dealer, it's a push. How anticlimactic..."
    else
      puts "The dealer won with a score of #{dealer_hand.hand_value} versus your measly score of #{player_hand.hand_value}. Game over! Thanks for playinhg, asshole!"
    end
  end

  def quit_check
    puts "Enter 'q' to quit, or press any other key to play again."
    unless gets.chomp.downcase == 'q'
      blackjack_game
    end
    puts "Thanks for letting us take your money."
    abort
  end

end
