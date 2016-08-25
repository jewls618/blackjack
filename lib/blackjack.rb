require_relative "deck"
require_relative "hand"
require_relative "card"

class Blackjack
  attr_reader :player, :dealer, :deck, :win_or_lose

  def initialize
    @deck = Deck.new
    @player = Hand.new
    @dealer = Hand.new
    @win_or_lose = 0
    deal_init_hand
    start
    user_choice
  end

  def deal_init_hand
    @player.hand << @deck.deal(1)[0]
    @player.hand << @deck.deal(1)[0]
    @dealer.hand << @deck.deal(1)[0]
    @dealer.hand << @deck.deal(1)[0]
  end

  def start
    puts "Welcome to Blackjack!"
    player_initial_hand
    player_total = player.calculate_hand
    puts "Player score: #{player_total}"
    puts "\nDealer was dealt: #{dealer.hand[0].rank}#{dealer.hand[0].suit}"
  end

  def user_choice
    move = "h"
    while move == "h" do
      print "\nHit or Stand (h/s): "
      move = gets.chomp.downcase
      if move == 'h'
        player.hit(deck)
        player_total = player.calculate_hand
        puts "\nPlayer was dealt: #{player.hand[-1].rank}#{player.hand[-1].suit}"
        puts "Player score: #{player_total}"
        bust(player_total)
      end
      if @win_or_lose == 1
        puts "You Bust."
        puts "\nDealer Wins"
        exit
      end
    end
    dealer_initial_hand
    dealer_choice
  end

  def dealer_choice
    dealer_turn
    if @win_or_lose == 1
      puts "Dealer busts."
      puts "\nYOU WIN!"
      exit
    end
    winner
  end

  def bust(loser)
    if loser > 21
      @win_or_lose = 1
    end
  end

  def winner
    player_total = player.calculate_hand
    dealer_total = dealer.calculate_hand
    if (player_total > dealer_total) && (@win_or_lose != 1)
      puts "\nPlayer Wins!"
    elsif (player_total < dealer_total) && (@win_or_lose != 1)
      puts "\nDealer Wins"
    else
      puts "\nPush"
    end
  end

  def player_initial_hand
    puts "\nPlayer was dealt: #{player.hand[0].rank}#{player.hand[0].suit}"
    puts "Player was dealt: #{player.hand[1].rank}#{player.hand[1].suit}"
  end

  def dealer_initial_hand
    puts "\nDealer was dealt: #{dealer.hand[0].rank}#{dealer.hand[0].suit}"
    puts "Dealer was dealt: #{dealer.hand[1].rank}#{dealer.hand[1].suit}"
  end

  def dealer_turn
    dealer_total = dealer.calculate_hand
    while dealer_total < 17 do
      dealer.hit(deck)
      dealer_total = dealer.calculate_hand
      puts "Dealer was dealt: #{dealer.hand[-1].rank}#{dealer.hand[-1].suit}"
    end
    puts "Dealer score: #{dealer_total}"
    bust(dealer_total)
  end
end

game = Blackjack.new
game
