require 'colorize'
require_relative 'chess_board'
require_relative 'cursor'

class Display

    attr_accessor :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def show_board
        @board.show_board
        @cursor.get_input
    end
end

board = Board.new
d = Display.new(board)
d.show_board
# p d.cursor.cursor_pos
# d.cursor.update_pos([2,2])
# p d.cursor.cursor_pos