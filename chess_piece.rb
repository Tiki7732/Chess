class Piece

    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol.to_s
    end

    def moves

    end

    def pos=(val)
        pos = val
    end

    def symbol
        color
    end

    private

    def moves_into_check?(end_pos)

    end

end
