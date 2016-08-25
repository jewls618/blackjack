class Hand
  attr_reader :hand, :deck

  def initialize
    @hand = []
  end

  def hit(deck)
    hand << deck.cards.pop
  end

  def calculate_hand
    ace_counter = 0
    sum = 0
    hand.each do |card|
      if card.is_face_card?
        sum += 10
      elsif card.is_ace?
        ace_counter += 1
        sum += 11
      else
        sum += card.rank
      end
    end
      while sum > 21 && ace_counter > 0
        sum -= 10
        ace_counter -= 1
      end
    return sum
  end
end
