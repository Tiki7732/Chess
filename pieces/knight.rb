require_relative 'piece'
require_relative 'stepable'
require 'colorize'

class Knight < Piece
    include stepable

end