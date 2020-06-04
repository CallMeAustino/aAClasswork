class Card

    SUITS = ["♠", "♦", "♥", "♣"]

    attr_reader :value, :suit

    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    def Card.generate_deck
        deck = []

        (2..14).each do |value|
            SUITS.each do |suit|
                deck << Card.new(value, suit)
            end
        end
        
        deck
    end

end