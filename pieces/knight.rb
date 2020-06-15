require_relative 'piece'
require_relative 'stepable'
require 'colorize'

class Knight < Piece
    include Stepable

    def symbol
        '♞'.colorize(color)
    end

    protected

    def moves_diff
        moves = [[-2,-1], [-2,1], [2, -1], [2,1], [1,2], [1,-2], [-1,2], [-1,-2]]
        moves
    end

end