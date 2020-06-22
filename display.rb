require 'colorize'
require_relative 'chess_board'
require_relative 'cursor'

class Display

    
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def show_board
        @board.show_board
    end
end

board = Board.new
d = Display.new(board)
d.show_board