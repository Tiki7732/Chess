class Rook < Piece
    include Slideable

    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def symbol 
        :Rook
    end
    
    protected
    def move_dirs
        
    end
end