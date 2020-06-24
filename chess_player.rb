require_relative 'display'
class Player

    def initialize(color, display)
        @color = color
        @display = display
    end

    def make_move
        input = @display.get_input
        case input
        when 'quit'
            return 'quit'
        when input.is_a?(Array)
            return input
        when true
            return true
        else
            return nil
        end
    end
end