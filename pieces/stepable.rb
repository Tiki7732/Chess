module Stepable

    def moves
        moves = []
        moves_diff.each do |new_pos|
            move_x, move_y = new_pos[0], new_pos[-1]
            x, y = pos[0], pos[-1]
            possible_move = [x + move_x, y + move_y]
            next unless board.valid_pos?(possible_move)
            moves.push(possible_move) if board.empty?(possible_move)
            moves.push(possible_move) if board[possible_move].color != color
        end
        moves
    end
private
    def moves_diff
        #defined in subclass
    end
end