module Slideable

end

module Stepable

end

class Piece

    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        color
    end

    def moves

    end

    def pos=(val)
        pos = val
    end

    def symbol

    end

    private

    def moves_into_check?(end_pos)

    end

end

