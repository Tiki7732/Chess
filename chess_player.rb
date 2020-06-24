require_relative 'display'
class Player

    attr_reader :color, :display
    def initialize(color, display)
        @color = color
        @display = display
    end

    def make_move(board)
        start_pos = nil
        end_pos = nil
        
        until start_pos && end_pos
            display.render
            if start_pos
                p "Move to where?"
                end_pos = display.cursor.get_input

            else
                p "It's #{color}'s turn to move!"
                start_pos = display.cursor.get_input

            end
        end

        [start_pos, end_pos]

    end
end