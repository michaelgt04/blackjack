require "spec_helper"

RSpec.describe Deck do

  let (:three) { Card.new('3', '♠') }
  let (:four) { Card.new('4', '♠') }

  let (:deck) { Deck.new }
  let (:player_hand) { Hand.new([three, four]) }

  describe "#initialize" do
    it "should contain an array" do
      expect(deck.cards).to be_a(Array)
    end

    it "should have 52 cards" do
      expect(deck.cards.size).to eq(52)
    end

    it "should only contain unique cards" do
      expect(deck.cards.uniq.size).to eq(52)
    end
  end

  describe "#hit" do
    it "should add another card object from the deck to the hand" do
      hand_size = player_hand.dealt_cards.size
      deck.hit(player_hand)
      expect(player_hand.dealt_cards.size).to eq(hand_size + 1)
    end
  end

  describe "#deal" do
    it "should deal two cards to players when called" do
      deck.deal(2)
      expect(deck.cards.size).to eq(50)
    end
  end


end
