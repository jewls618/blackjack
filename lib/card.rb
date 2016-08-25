class Card
  attr_reader :suit
  attr_accessor :rank

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def is_face_card?
    rank == "J" || rank == "K" || rank == "Q"
  end

  def is_ace?
    rank == "A"
  end
end
