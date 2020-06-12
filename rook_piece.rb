require_relative 'chess_piece'
require_relative 'slideable'
class Rook < Piece
    include Slideable

    attr_reader :color, :board, :pos
 

    def symbol 
        '♜'.colorize(color)
    end

    protected
    def move_dirs
        horizontal_and_verical
    end
end