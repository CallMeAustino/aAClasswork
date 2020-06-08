# execution and time difference algorithms
class Array


    def my_min #This should be O(n) time complexity as you only iterate through the array once
        min_num = self[0]
        self.each {|num| min_num = num if num < min_num}
        min_num
    end

    def my_min_bad

    end

    require 'byebug'
    def contiguous_sum
        return self.max if self.none? {|ele| ele >= 0 }
        biggest_sum = self[0]
        result = 0
        self[1..-1].each do |num|
            # debugger
            if biggest_sum == 0 && num > 0 
                biggest_sum = num
            elsif biggest_sum + num > 0 
                biggest_sum += num
            else
                biggest_sum = 0
            end
            result = biggest_sum if biggest_sum > result
        end
        return result if result > 0
        0
    end
    # require 'byebug'
    
    def subsets #2^n + n^2 but n^2 is dominated so subsets should be 2^n
        # return [self] if self.empty?
        return [[], self] if self.length == 1
        subs = (self[0...-1]).subsets 
        subs + subs.map {|ele| ele += [self.last]} #O(n)
    end 
    
    def max_subset #quadratic O(n^2)
        subsets = self.subsets
        max = 0
        subsets.each {|set| max = set.sum if set.sum > max}
        max
    end


end

# p ([2, 3, -6, 7, -6, 7].contiguous_sum)
# p [-5, -1, -3].contiguous_sum

require 'byebug'

def anagrams(string1, string2) #[do, od] [dog, dgo, odg, ogd, gdo, god] [fart, frat, ftar, ftra, afrt, arft, atrf, artf, ]
    
    #The time complexity for permutations is O(n!), for every additional element, you are increasing the work from 2!, 3!, 4! etc. 
    string_arr = string1.split("")
    a = string_arr.permutation.to_a
    result = []
    a.each do |perm|
        result << perm.join("")
    end
    return true if result.include?(string2)
    false
end

# p anagrams("farat","taraf")

def second_anagram?(string1, string2)
    string1_arr = string1.split("") #O(n)
    string2_arr = string2.split("") #O(n)

    string1_arr.each.with_index do |char, i| #O(n)
        index = string2_arr.index(char) #O(n)
        string2_arr.delete_at(index) if index != nil #O(n)
    end
    return true if string2_arr.empty?
    false
end

def third_anagram?(string1, string2)
    sorted1 = string1.split("").sort 
    sorted2 = string2.split("").sort

    max_index = sorted1.length-1
        (0..max_index).each do |index|
            return false if sorted1[index] != sorted2[index]
        end
        true
end


p third_anagram?("hello","yey")