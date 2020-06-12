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
        grid[x][y]
    end

    def []=(pos, val)
        x, y = pos[0], pos[1]
        grid[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        raise "No piece at this position" if self[start_pos].nil?
        raise "Can't move there!" if !valid_pos?(end_pos)
        piece = self[start_pos]
        self[start_pos] = nil
        self[end_pos] = piece

    end

    def valid_pos?(pos)
        x, y = pos[0], pos[1]
        return false if !x.between?(0, 7)
        return false if !y.between?(0, 7)
        true
    end

end


