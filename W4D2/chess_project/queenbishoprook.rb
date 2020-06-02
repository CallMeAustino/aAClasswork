require_relative 'modules'
require_relative 'pieces'

class Queen < Piece
    include Slideable
end

class Rook < Piece
    include Slideable
end

class Bishop < Piece
    include Slideable
end