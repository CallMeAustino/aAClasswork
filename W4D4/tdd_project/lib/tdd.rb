class Array
    
    def my_uniq
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        hash.keys
    end

    def two_sum
        sums = []
        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                sums << [idx1, idx2].sort if idx1 > idx2 && ele1 + ele2 == 0
            end
        end
        sums.sort
    end

end

def my_transpose(array)
    
    redundant

    results = []
    max_index = array.length - 1

    (0..max_index).each do |idx|
        temp_arr = []

        array.each do |subarr|
            temp_arr << subarr[idx]
        end

        results << temp_arr
    end
    
    results
end

def redundant
end

class CustomError < StandardError; end

def stock_picker(days)
    raise CustomError if days.any? { |day| !day.is_a?(Integer) }

    biggest_diff = 0
    best_days = []
    days.each_with_index do |price1, day1|
        days.each_with_index do |price2, day2|
            if day2 > day1 && price2 - price1 > biggest_diff
                biggest_diff = price2 - price1
                best_days = [day1, day2]
            end
        end
    end
    p "The most profitable day to buy and sell is day #{best_days.first + 1} and #{best_days.last + 1}."
end