# encoding: utf-8
require './board'

class Piece
  
  attr_accessor :color, :board, :king, :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @king = false
    @pos = pos
  end
  
  BLACK_DIRS = [ [1, 1], [1, -1] ]
  WHITE_DIRS = [ [-1, 1], [-1, -1] ]
  
  def move_dirs
    return WHITE_DIRS if @color == :white && !@king
    return BLACK_DIRS if @color == :black && !@king
    return WHITE_DIRS + BLACK_DIRS if @king
  end
  
  def possible_slides
    possible_moves = []
    self.move_dirs.each_with_index do |dir|
      new_dir = [ dir[0] + @pos[0], dir[1] + @pos[1] ]
      possible_moves << new_dir if @board.grid[new_dir[0]][new_dir[1]] == nil
    end
    possible_moves.select do |move|
      (0..7).include?(move[0]) && (0..7).include?(move[1])
    end
  end
  
  def perform_jump
    
  end
  
  def move(end_pos)
    if possible_slides.include?(end_pos)
      @board.positions.delete(@pos)
      @pos = end_pos
      @board.positions[@pos] = self
    end
    @board.update_grid
    nil
  end
  
  def dup
    self.class.new(@color, @board, @pos)
  end
  
  def render
    return "❂" if @color == :white && !@king
    return "❍" if @color == :black && !@king
  end
  
end