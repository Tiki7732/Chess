require_relative 'pieces'
require 'colorize'
class Board

    attr_reader :grid, :sentinel

    def initialize(populate = true)
        @sentinel = NullPiece.instance
        @grid = Array.new(8) {Array.new(8, sentinel)}
        populate_board(populate)
    end

    def [](pos)
        x, y = pos[0], pos[1]
        grid[x][y]
    end

    def []=(pos, val)
        x, y = pos[0], pos[1]
        grid[x][y] = val
    end

    def move_piece(start_pos, end_pos, color)
        perform_move_checks(start_pos, end_pos, color)
        move_piece!(start_pos, end_pos)
    end

    def move_piece!(start_pos, end_pos)
        piece = self[start_pos]
        self[start_pos] = sentinel
        self[end_pos] = piece
        piece.pos = end_pos
    end

    def checkmate?(color)
        return false unless in_check?(color)
        pieces = find_pieces(color)
        pieces.all?{|piece| piece.valid_moves?.empty?}
    end

    def in_check?(color)
        king = self[find_king(color)]
        other_color = color == :black ? :white : :black
        pieces = find_pieces(other_color)
        pieces.each do |piece|
            return true if piece.moves.any?{|pos| pos == king.pos}
        end
        false
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

    def add_piece(piece, pos)
        self[pos] = piece if valid_pos?(pos) && empty?(pos)
    end

    def show_board
        print "   a  b  c  d  e  f  g  h" + "\n"
        rows = grid.length
        grid.each do |row|
            print rows.to_s + " "
            row.each {|space| print space.to_s}
            print rows.to_s
            rows -= 1
            print "\n"
        end
        print "   a  b  c  d  e  f  g  h" + "\n"
    end

    def duplicate
        dup_board = Board.new(false)
        pieces = find_pieces(:white) + find_pieces(:black)
        pieces.each {|piece| piece.class.new(piece.color, dup_board, piece.pos)}
        dup_board
    end

    private

    def perform_move_checks(start_pos, end_pos, color)
        raise "No piece at this position" if self[start_pos].nil?
        raise "Can't move there!" if !valid_pos?(end_pos)
        piece = self[start_pos]
        raise "Piece doesn't move like that" if !piece.moves.include?(end_pos)
        raise "That move puts you in check!" if !piece.valid_moves?.include?(end_pos)
        raise "Can't move opponents piece!" if piece.color != color
    end

    def populate_board(populate)
        if populate
            [:white, :black].each do |color|
                fill_back_row(color)
                fill_pawn_row(color)
            end
        end
    end

    def fill_back_row(color)
        start_row = color == :white ? 7 : 0
        back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        back_row.each_with_index { |piece, ind| piece.new(color, self, [start_row, ind]) }
    end

    def fill_pawn_row(color)
        start_row = color == :white ? 6 : 1
        8.times { |num| grid[start_row][num] = Pawn.new(color, self, [start_row, num]) }
    end


    def find_pieces(color)
        one_side = []
        grid.flatten.each {|piece| one_side.push(piece) if piece.color == color}
        one_side
    end

    def find_king(color)
        grid.flatten.each {|piece| return piece.pos if piece.color == color && piece.is_a?(King)}
    end

end
