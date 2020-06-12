require_relative 'chess_piece'
class Board

    def populate_board
        grid = Array.new(8) {Array.new(8)}
        grid[0].map! { |space| space = Piece.new("black") }
        grid[1].map! { |space| space = Piece.new("black") }
        grid[6].map! { |space| space = Piece.new("White") }
        grid[7].map! { |space| space = Piece.new("White") }
        grid
    end

    public
    attr_reader :grid

    def initialize
        @grid = self.populate_board
    end

    def [](pos)
        x, y = pos[0], pos[1]
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos[0], pos[1]
        @grid[x][y] = val
    end

end


