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

    def switch_players(color)
        color == :black ? :white : :black
    end
end