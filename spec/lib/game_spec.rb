require "spec_helper"

describe Game do

  let(:game) { Game.new }

  let (:three) { Card.new('3', '♠') }
  let (:four) { Card.new('4', '♠') }
  let (:five) { Card.new('5', '♠') }
  let (:king) { Card.new('K', '♠') }
  let (:queen) { Card.new('Q', '♠') }
  let (:ace_heart) { Card.new('A', '♥') }
  let (:ace_spade) { Card.new('A', '♠') }

  let (:hand) { Hand.new([three, four]) }
  let (:sample_dealer_hand) { Hand.new([king, five]) }
  let (:twenty_one_hand) { Hand.new([king, ace_spade]) }
  let (:five_card_charlie) { Hand.new([king, ace_heart, ace_spade, three, four]) }
  let (:bust_hand) { Hand.new([king, three, four, five])}

  describe "#initialize" do

    it "should show the player various statistics (eg, face value, score) about their cards" do
      expect{game}.to output.to_stdout
    end

  end

  describe "#hit_stand" do

    it "should add one size to player's hand if they choose to hit" do
      game
      before_size = game.player_hand.dealt_cards.size
      game.hit_stand
      expect(game.player_hand.dealt_cards.size).to eq(before_size + 1)
    end

    it "should not reflect a change in hand size if the player stands" do
      game
      before_size = game.player_hand.dealt_cards.size
      game.hit_stand
      expect(game.player_hand.dealt_cards.size).to eq(before_size)
    end

  end

  describe "#dealer_hit_stand" do

    it "should hit if the dealer has less than 17" do
      game
      game.dealer_hand = sample_dealer_hand
      game.dealer_hit_stand
      expect(game.dealer_hand.dealt_cards.size).to eq(3)
    end

    it "should stand if the dealer has more than 17" do
      game
      game.dealer_hand = twenty_one_hand
      game.dealer_hit_stand
      expect(game.dealer_hand.dealt_cards.size).to eq(2)
    end

    it "should report that the dealer has busted if he busts" do
      game
      game.dealer_hand = sample_dealer_hand
      game.dealer_hand.dealt_cards << queen
      expect { game.dealer_hit_stand }.to output("The dealer has gone bust!\n").to_stdout
    end
  end

  describe "#winner" do
    it "should return a string declaring the winner" do
      game
      game.dealer_hand = sample_dealer_hand
      game.dealer_hand.dealt_cards << three
      game.player_hand = twenty_one_hand
      expect(game.winner).to output.("You win! You had a score of #{@player_hand.hand_value} and the dealer only had #{@dealer_hand.hand_value}.\n").to_stdout
    end

  end

end
