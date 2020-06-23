class Piece

    attr_reader :color, :board
    attr_accessor :pos
    def initialize(color, board, pos)
        colors = [:white, :black, :green]
        raise "Invalid color!" if !colors.include?(color) 
        raise "Not a valid pos" if !board.valid_pos?(pos)
        @color = color
        @board = board
        @pos = pos
        board.add_piece(self, pos)
    end

    def to_s
        " #{symbol} "
    end

    def moves

    end

    def pos=(val)
        @pos = val
    end

    def symbol
        
    end

    def empty?
        false
    end

    def valid_moves?
        moves.reject{|move| moves_into_check?(move)}
    end

    private

    def moves_into_check?(end_pos)
        new_board = @board.duplicate
        new_board.move_piece(pos, end_pos)
        new_board.in_check?(color)

    end

 

end
