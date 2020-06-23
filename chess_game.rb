require_relative 'chess_board'
require_relative 'display'
require_relative 'chess_player'

class Game

    def initialize
        @board = Board.new
        @display = Display.new(board)
        @player1 = Player.new
        @player2 = Player.new
        @current_player = :white
    end

    def switch_players()
        @current_player = @current_player == :black ? :white : :black
    end

    def play
        until board.checkmate?(@current_player)
            
    end
end