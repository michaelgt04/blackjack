class Card
attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def face_card?
    'JQK'.include?(rank)
  end

  def ace?
    rank == 'A'
  end

  def display
    "#{rank}#{suit}"
  end

end
