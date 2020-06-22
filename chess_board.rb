require_relative 'pieces'
require 'colorize'
class Board

    attr_reader :grid, :sentinel

    def initialize
        @sentinel = NullPiece.instance
        @grid = Array.new(8) {Array.new(8, sentinel)}
        populate_board
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
        turn_color = nil
        perform_move_checks(start_pos, end_pos, turn_color)
        piece = self[start_pos]
        self[start_pos] = sentinel
        self[end_pos] = piece
        piece.pos = end_pos
    end

    def perform_move_checks(start_pos, end_pos, turn_color)
        raise "No piece at this position" if self[start_pos].nil?
        raise "Can't move there!" if !valid_pos?(end_pos)
        piece = self[start_pos]
        raise "Piece doesn't move like that" if !piece.moves.include?(end_pos)
        #raise "It's the other players turn" if piece.color != turn_color
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
       
        [:white, :black].each do |color|
            fill_back_row(color)
            fill_pawn_row(color)
        end
    end

    def fill_back_row(color)
        start_row = color == :white ? 7 : 0
        back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        back_row.each_with_index do |piece, ind|
           piece.new(color, self, [start_row, ind])
        end
    end

    def fill_pawn_row(color)
        start_row = color == :white ? 6 : 1
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

    def in_check?(color)
        piece = self[find_king(color)]
        puts piece.to_s
    end

    def find_king(color)
        grid.each do |row|
            row.each do |piece| 
                if piece.color == color && piece.is_a?(King)
                    return piece.pos
                end
            end
        end
    end
    
end

board = Board.new
board.in_check?(:white)