require_relative 'chess_board'
require_relative 'display'
require_relative 'chess_player'

class Game

    attr_reader :board, :display, :player1, :player2, :current_player
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player1 = Player.new(:white, @display)
        @player2 = Player.new(:black, @display)
        @current_player = @player1
    end

    def switch_players()
        @current_player = @current_player == @player1 ? @player2 : @player1
    end

    def check?(color)
        if board.in_check?(color) && !board.checkmate?(color)
            p "#{color} you are in check!" 
            sleep(3)
        end
    end


    def play
        until board.checkmate?(current_player.color)
            begin
             start_pos, end_pos = current_player.make_move(board)
             board.move_piece(start_pos, end_pos, current_player.color)
             switch_players
             check?(current_player.color)

            rescue RuntimeError => e
                p e.message
                sleep(3)
                retry
            end
        end
        display.render
        p "Checkmate! #{current_player.color} looses"

    end
end

if $PROGRAM_NAME == __FILE__
    Game.new.play
end

