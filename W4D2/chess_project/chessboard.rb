require "byebug"

require_relative "pieces"

class Board
attr_accessor :grid
    def initialize
        @grid = Array.new(8) {Array.new(8,Piece.new)}
    end

    def move_piece(start_pos, end_pos) #[1,1]
    #    debugger
       raise "No piece!" if @grid[start_pos[0]][start_pos[1]].is_a?(NullPiece)
       raise "Position occupied!" if !self[[end_pos[0]][end_pos[1]]].is_a?(NullPiece)

       moving_piece = @grid[start_pos[0]][start_pos[1]]
       @grid[start_pos[0]][start_pos[1]] = nil
       @grid[end_pos[0]][end_pos[1]] = moving_piece
    end

    # def [](position)  #@board[start_pos] ==> @board[row][col]
    #     row, col = position
    #     @grid[row][col]
    # end 

    # def []=(pos,mark)
    #     row, col = pos
    #     @grid[row][col] = mark
    # end

end
