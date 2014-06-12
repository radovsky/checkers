require './board'

class Piece
  
  attr_accessor :color, :board, :king, :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @king = false
    @pos = pos
  end
  
  WHITE_DIRS = [ [1, 1], [1, -1] ]
  BLACK_DIRS = [ [-1, 1], [-1, -1] ]
  
  def move_dirs
    WHITE_DIRS if @color == :white && !@king
    BLACK_DIRS if @color == :black && !@king
    WHITE_DIRS + BLACK_DIRS if @king
  end
  
  def perform_slide
    
  end
  
  def perform_jump
    
  end
  
  def render
    return "0" if @color == :white && !@king
    return "O" if @color == :black && !@king
  end
  
end