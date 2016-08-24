require "spec_helper"

RSpec.describe Card do

  let(:ace_card) {Card.new("A", "♠")}
  let(:face_card) {Card.new("K", "♠")}
  let(:card) {Card.new("7", "♠")}

  describe "#initialize" do

    it "should have a rank" do
      expect(ace_card.rank).to eq("A")
    end

    it "should have a suit" do
      expect(card.suit).to eq("♠")
    end
  end

  describe "#face_card?" do
    it "should return true if the card is a face card" do
      expect(card.face_card?).to eq(false)
      expect(face_card.face_card?).to eq(true)
    end
  end

  describe "#ace?" do
    it "should return true if the card is an ace" do
      expect(ace_card.ace?).to eq(true)
      expect(face_card.ace?).to eq(false)
    end
  end

end
