# encoding: utf-8
require './board'

class Piece
  
  attr_accessor :color, :board, :king, :pos
  
  def initialize(color, board, pos, king=false)
    @color = color
    @board = board
    @pos = pos
    @king = king
  end
  
  BLACK_DIRS = [ [1, 1], [1, -1] ]
  WHITE_DIRS = [ [-1, 1], [-1, -1] ]
  
  def move_dirs
    return WHITE_DIRS if @color == :white && !@king
    return BLACK_DIRS if @color == :black && !@king
    return WHITE_DIRS + BLACK_DIRS if @king
  end
  
  def in_bounds?(move)
    (0..7).include?(move[0]) && (0..7).include?(move[1])
  end
  
  def get_new_positions(num_spaces)
    positions = []
    self.move_dirs.each do |dir|
      new_dir = [ dir[0] * num_spaces + @pos[0], dir[1] * num_spaces + @pos[1] ]
      positions << new_dir
    end
    positions
  end
  
  def possible_slides
    self.get_new_positions(1).select do |new_pos|
      in_bounds?(new_pos)
    end
  end
  
  def possible_jumps
    # jumps = []
    # self.move_dirs.each do |dir|
    #   if 
    # end
  end 
  
  def perform_slide(end_pos)
    if possible_slides.include?(end_pos) && end_pos.nil?
      @board.positions.delete(@pos)
      @pos = end_pos
      @board.positions[@pos] = self
    else
      raise "not a valid move"
    end
    @board.update_grid
    nil
  end
  
  def perform_jump(end_pos)

  end
  
  def render
    return "❂" if @color == :white && !@king
    return "❍" if @color == :black && !@king
  end
  
end