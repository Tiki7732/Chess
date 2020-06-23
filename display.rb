require 'colorize'
require_relative 'chess_board'
require_relative 'cursor'

class Display

    attr_accessor :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
        @selected = false
    end

    def render
        print "  abcdefgh" + "\n"
        rows = @board.grid.length
        @board.grid.each.with_index do |row, ind_1|
            print rows.to_s + " "
            row.each.with_index {|space, ind_2| print space.to_s.colorize(pos_color([ind_1, ind_2]))}
            print rows.to_s
            rows -= 1
            print "\n"
        end
        print "  abcdefgh" + "\n"
        # @cursor.get_input
    end

    def pos_color(pos)
        x, y = pos
        if pos == @cursor.cursor_pos
          bg = @selected ? :yellow : :magenta
           #bg = :magenta
        elsif (x + y).odd? 
            bg = :light_cyan
        else
            bg = :blue
        end
        {background: bg}
    end

    def display_loop
        quit = false
        until quit
            system('clear')
            self.render
            input = @cursor.get_input
            quit = true if input == 'quit'
            @selected = !@selected if input == true
            
        end
    end
end

board = Board.new

d = Display.new(board)
d.render
# d.display_loop
# p d.cursor.cursor_pos
# d.cursor.update_pos([2,2])
# p d.cursor.cursor_pos
