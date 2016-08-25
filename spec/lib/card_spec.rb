require "spec_helper"

RSpec.describe Card do
  let(:card1) { Card.new(10, "♥") }
  let(:card2) { Card.new(11, "♥") }
  let(:card3) { Card.new("A", "♥")}
  let(:card4) { Card.new("K", "♥")}

  describe ".new" do
    it "should return the correct rank" do
      expect(card1.rank).to eq(10)
      expect(card3.rank).to eq("A")
    end

    it "should return the correct suit" do
      expect(card1.suit).to eq("♥")
      expect(card2.suit).to eq("♥")
    end

    it "should be a card class" do
      expect(card1).to be_a(Card)
    end
  end

  describe "#is_face_card?" do
    it "return true if card is a face card" do
      expect(card1.is_face_card?).to eq(false)
      expect(card2.is_face_card?).to eq(false)
      expect(card3.is_face_card?).to eq(false)
      expect(card4.is_face_card?).to eq(true)
    end
  end

  describe "#is_ace?" do
    it "return true if card is an Ace" do
      expect(card1.is_ace?).to eq(false)
      expect(card2.is_ace?).to eq(false)
      expect(card3.is_ace?).to eq(true)
      expect(card4.is_ace?).to eq(false)
    end
  end
end
