require 'card'

describe 'Card#initialize' do
    it "should create a card with a value and a suit" do
        expect{ Card.new(2,"♥") }.to_not raise_error
    end
end
    
describe 'Card#value' do 
    it "should be able to read the value" do
        card = Card.new(2,"♥")
        expect(card.value).to eq(2)
    end
end

describe 'Card#suit' do
    it "should be able to read the suit" do
        card = Card.new(2,"♥")
        expect(card.suit).to eq("♥")
    end
end

describe 'Card::generate_deck' do 
    
    it 'should create a deck of 52 cards' do
        deck = Card.generate_deck
        expect(deck.length).to eq(52)
    end

    it 'should produce standard cards' do
        deck = Card.generate_deck
        expect([deck.first.value, deck.first.suit]).to eq([2,"♠"])
        expect([deck.last.value, deck.last.suit]).to eq([14,"♣"])
    end
end

# deck.all? { |card| SUIT.include?(card.suit) }

# RSpec.describe Order do
#   let(:customer) { double("customer") }
#   subject(:order) { Order.new(customer) }

#   it "sends email successfully" do
#     allow(customer).to receive(:email_address).and_return("ned@appacademy.io")

#     expect do
#       order.send_confirmation_email
#     end.to_not raise_exception 
#   end
# end