require_relative 'pieces'
require 'colorize'
class Board

    attr_reader :grid, :sentinel

    def initialize
        @sentinel = NullPiece.instance
        @grid = Array.new(8) {Array.new(8, sentinel)}
        self.populate_board
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
        self[pos].empty?
    end

    def populate_board
       
        [:red, :green].each do |color|
            fill_back_row(color)
            fill_pawn_row(color)
        end
    end

    def fill_back_row(color)
        start_row = color == :red ? 7 : 0
        back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        grid[start_row].map!.with_index do |piece, ind|
            piece = back_row[ind].new(color, self, [start_row, ind])
        end
    end

    def fill_pawn_row(color)
        start_row = color == :red ? 6 : 1
        8.times do |num| 
            grid[start_row][num] = Pawn.new(color, self, [start_row, num])
        end
    end

    def show_board
        grid.each do |row|
            row.each {|space| print space.to_s + " "}
            print "\n"
        end
    end

    def add_piece(piece, pos)
        self[pos] = piece if valid_pos?(pos) && empty?(pos)
    end


end

b = Board.new
b.show_board
#p b.empty?([2,0])
# r = Rook.new(:green, b, [0,0])
# b.add_piece(r, r.pos)

# r2 = Rook.new(:blue, b, [7,0])
# b.add_piece(r2, r2.pos)
# q = Queen.new(:green, b, [0,3])
# b.add_piece(q, q.pos)

# bishop = Bishop.new(:green, b, [0,2])
# k = Knight.new(:green, b, [0,1])
# king = King.new(:green, b, [0,4])
# b.add_piece(king, king.pos)
# b.add_piece(k, k.pos)
# b.add_piece(bishop, bishop.pos)
# b.show_board
# # p r.moves
# # p bishop.moves
# # p r2.moves
# # p q.moves
# p king.moves
