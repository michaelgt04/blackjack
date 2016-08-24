class Hand
attr_accessor :dealt_cards

  def initialize(dealt_cards)
    @dealt_cards = dealt_cards
  end

  def hand_value
    sum = 0
    values_in_hand = []
    @dealt_cards.each do |card|
      values_in_hand << card.rank
      if card.face_card?
        sum += 10
      elsif card.ace?
        sum += 1
      else
        sum += card.rank.to_i
      end
    end
    if values_in_hand.include?("A")
      if sum <= 11
        sum += 10
        return sum
      else
        return sum
      end
    end
    sum
  end

  def bust?
    hand_value > 21
  end

  def display_hand(competitor)
    if competitor == "Dealer"
      puts "Dealer shows a #{dealt_cards[0].display}"
    else
      puts "Player has: "
      dealt_cards.each do |card|
        print "#{card.display} "
      end
      puts "\n"
      puts "Player's score: #{hand_value} \n \n"
    end
  end

  def under_17?
    hand_value < 17
  end

end

# hand = Hand.new(deck.deal(2))
