require_relative 'chess_piece'
class Board

    def make_board
        grid = Array.new(8) {Array.new(8)}
        grid[0].each { |space| space = Piece.new("black") }
        grid
    end

    public
    attr_reader :grid

    def initialize
        @grid = self.make_board

    end

end

b = Board.new
