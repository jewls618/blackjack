require "spec_helper"

RSpec.describe Deck do
  let(:deck1) { Deck.new }
  let(:deck2) { Deck.new }
  let(:deck3) { Deck.new }
  let(:deck4) { Deck.new }

  describe ".new" do
    it "should be a an array of Cards" do
      expect(deck1.cards).to be_a(Array)
    end

    it "should be a Deck object" do
      expect(deck1).to be_a(Deck)
    end

    it "should be an array of Cards" do
      expect(deck1.cards[0]).to be_a(Card)
    end
  end

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck1.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck1.cards.uniq.size).to eq 52
    end
  end
end
