require_relative "piece"
require 'colorize'

class Pawn < Piece

    def symbol
        '♟'.colorize(color)
    end
   
    def moves
        forward_moves + attack
    end

private

 def forward_moves
        x, y = pos
        two_steps = [x + (2 * forward_step), y]
        one_step = [x + forward_step, y]
        moves = []
        return moves unless board.valid_pos?(one_step) && board.empty?(one_step)
        moves.push(one_step)
        moves.push(two_steps) if board.empty?(two_steps) && start_line?
        moves
    end

    def attack
        x, y = @pos
        attack_pos = [[x + forward_step, y + 1], [x + forward_step, y - 1]]
        attack_pos.reject!{|pos| pos if !board.valid_pos?(pos)}
        attack_pos.reject!{|pos| pos if board.empty?(pos)}
        attack_pos.reject!{|pos| pos if board[pos].color == color}
        attack_pos
    end

    def forward_step
        color == :white ? -1 : 1
    end

    def start_line?
        if color == :white && pos[0] == 6
            return true
        elsif color == :black && pos[0] == 1
            return true
        else
            return false
        end

    
end
end
