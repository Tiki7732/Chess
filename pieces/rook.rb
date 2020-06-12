require_relative 'piece'
require_relative 'slideable'
require 'colorize'
class Rook < Piece
    include Slideable

    attr_reader :color, :board, :pos
 

    def symbol 
        '♜'.colorize(color)
    end

    protected
    def move_dirs
        horizontal_and_vertical
    end
end

