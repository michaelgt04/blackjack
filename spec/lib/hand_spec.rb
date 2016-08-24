require "spec_helper"

RSpec.describe Hand do

  let (:three) { Card.new('3', '♠') }
  let (:four) { Card.new('4', '♠') }
  let (:five) { Card.new('5', '♠') }
  let (:king) { Card.new('K', '♠') }
  let (:ace_heart) { Card.new('A', '♥') }
  let (:ace_spade) { Card.new('A', '♠') }

  let (:hand) { Hand.new([three, four]) }
  let (:high_hand) { Hand.new([king, five]) }
  let (:twenty_one_hand) { Hand.new([king, ace_spade]) }
  let (:five_card_charlie) { Hand.new([king, ace_heart, ace_spade, three, four]) }
  let (:bust_hand) { Hand.new([king, three, four, five])}

  describe "#initialize" do
    it "should contain an array of cards" do
      expect(hand.dealt_cards).to be_a(Array)
    end

    it "should consist of two cards when initialized" do
      expect(hand.dealt_cards.size).to eq(2)
    end

    it "should consist of card objects" do
      expect(hand.dealt_cards[0]).to be_a(Card)
      expect(hand.dealt_cards[1]).to be_a(Card)
    end
  end

  describe "#hand_value" do
    it "should calculate the value of the hand" do
      expect(hand.hand_value).to eq(7)
      expect(high_hand.hand_value).to eq(15)
    end

    it "should properly account for the changing values of aces" do
      expect(twenty_one_hand.hand_value).to eq(21)
      expect(five_card_charlie.hand_value).to eq(19)
    end
  end

  describe "#bust?" do
    it "should return true if the hand value is greater than 21" do
      expect(bust_hand.bust?).to eq(true)
      expect(high_hand.bust?).to eq(false)
    end
  end

  describe "#under_17?" do
    it "returns true if the hand is less than 17" do
      expect(hand.under_17?).to eq(true)
    end

    it "returns false if the hand is greater than 17" do
      expect(twenty_one_hand.under_17?).to eq(false)
    end
  end


end
