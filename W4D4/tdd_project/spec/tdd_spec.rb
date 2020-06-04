require "tdd"

describe "my_uniq" do
    it "should accept an Array as an argument" do
        expect{ [11, 5, 13, 2, 3].my_uniq }.to_not raise_error
    end
    
    it "should return no duplicates" do
        expect( [3, 2, 1, 1, 3].my_uniq ).to eq([3, 2, 1])
    end
end

describe "two_sum" do
    it "should accept an array as an argument" do
        expect{ [-1, 0, 2, -2, 1].two_sum }.to_not raise_error(NoMethodError)
    end

    it "should return pairs of numbers that sum 0" do
        expect( [-1, 0, 2, -2, 1].two_sum ).to eq([[0, 4], [2, 3]])
    end
end

describe "my_transpose" do
    
    let(:foo) { self }

    it "should accept an array as an argument" do
        expect{ my_transpose([1, 1]) }.to_not raise_error
    end

    it "should return the transposed array" do
        expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq(([[0, 3, 6],[1, 4, 7],[2, 5, 8]]))
    end

    it "calls the method #redundant" do
        expect(foo).to receive(:redundant) #--> listener for call 
        my_transpose([1,1])
    end
end

describe "stock_picker" do
    it "should accept an array as an argument" do
        expect{stock_picker([0,1,2,3]) }.to_not raise_error
    end

    it "should only contain integers" do
        expect{ stock_picker([0, 1, 2, 3, 'bob', :s]) }.to raise_error(CustomError)
    end

    it "should return the most profitable days to buy and sell the stock in an array" do
        expect(stock_picker([10,0,50,20,1000])).to include("2", "5")
    end
end
