require_relative "chessboard"
require 'singleton'
class Piece
attr_accessor :board, :position, :color

    def initialize(position) #[X,Y]
        @color = Symbol
        @board = Board.new
        @position = position
        @board.grid[position[0]][position[1]] = self
    end

    def moves
    end

end

class NullPiece < Piece
    include Singleton
    def initialize
    end
end