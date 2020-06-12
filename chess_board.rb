require_relative 'pieces'
class Board

    def populate_board
        grid = Array.new(8) {Array.new(8)}
        # grid[0].each_index { |ind| grid[0][ind] = Rook.new("black", self, [0, ind]) }
        # grid[1].each_index { |ind| grid[1][ind] = Piece.new("black", self, [1, ind]) }
        # grid[6].each_index { |ind| grid[6][ind] = Piece.new("white", self, [6, ind]) }
        # grid[7].each_index { |ind| grid[7][ind] = Piece.new("white", self, [7, ind]) }
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

    def empty?(pos)
        self[pos].nil?
    end


    def show_board
        grid.each do |row|
            row.each {|space| print space.to_s + " "}
            print "\n"
        end
    end

end

b = Board.new
b.show_board
r = Rook.new("black", b, [0,0])
p r.moves
