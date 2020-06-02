require_relative 'modules'
require_relative 'pieces'

class Knight < Piece
    attr_reader :moves
    include Steppable
    def initialize(position)
        super(position)
        @moves = [[2,1], [-2,1], [2,-1], [-2, -1], [1,2], [-1,2], [1,-2], [-1,-2]]
    end

    # def move_diffs
    #     return [[2,1] [-2,1] [2,-1] [-2, -1] [1,2] [-1,2] [1,-2], [-1,-2]] 
    # end
end

class King < Piece
    include Steppable
    def move_diffs
       return [[1,0], [-1,0], [0,1], [0,-1], [1,1], [1,-1], [-1,1], [-1,-1]]
    end 
end


