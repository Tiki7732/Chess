require_relative 'chess_piece'
class Board

    def populate_board
        grid[0].map! { |space| space = Piece.new("black") }
    
    end

    public
    attr_reader :grid

    def initialize
        @grid = Array.new(8) {Array.new(8)}
        self.populate_board
    end

end

b = Board.new
