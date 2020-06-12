module Slideable
    HORIZONTAL_AND_VERTICAL = [[-1,0], [1, 0], [0, -1], [0, 1]]
    DIAGONAL = [[-1,-1], [-1,1], [1, -1], [1,1]]
    
    def horizontal_and_vertical
        HORIZONTAL_AND_VERTICAL
    end

    def diagonal
        DIAGONAL
    end

    def moves
        moves = []
        move_dirs.each do |dx, dy|
            moves.concat(grow_unblocked_moves_in_dir(dx, dy))
        end
        moves
    end

    private
    def moves_dirs
        #implemented in subclass
       
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        current_x , current_y = pos[0], pos[1]
        moves = []
        possible_x, possible_y = current_x + dx, current_y + dy
        possible_pos = [possible_x, possible_y]
        while board.valid_pos?(possible_pos)
            if board.empty?(possible_pos)
                moves.push(possible_pos)
            else
                moves.push(possible_pos) if board[possible_pos].color != color
            break
            end
            possible_x, possible_y = possible_x + dx, possible_y + dy
            possible_pos = [possible_x, possible_y]
            
        end
        moves
    end


end