class Deck
attr_accessor :cards

  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUITS = ['♦', '♣', '♠', '♥']


  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!
  end

  def deal(number)
    @cards.pop(number)
  end

  def hit(hand)
    hand.dealt_cards << deal(1)[0]
    hand.dealt_cards[-1].display
  end

end
