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
      @board.grid[new_pos[0]][new_pos[1]] == nil && in_bounds?(new_pos)
    end
    
  end
  
  def possible_jumps
    jumps = []
    self.move_dirs.each do |dir|
      if @board.grid[@pos[0] + dir[0]][@pos[1] + dir[1]].class == Piece
        if @board.grid[@pos[0] + dir[0]][@pos[1] + dir[1]].color != @color
          if @board.grid[@pos[0] + dir[0] * 2][@pos[1] + dir[1] * 2] == nil
            if in_bounds?([@pos[0] + dir[0] * 2, @pos[1] + dir[1] * 2])
              jumps << [@pos[0] + dir[0] * 2, @pos[1] + dir[1] * 2]
            end
          end
        end
      end
    end
    jumps
  end 
  
  def perform_slide(end_pos)
    if possible_slides.include?(end_pos)
      @board.positions.delete(@pos)
      @pos = end_pos
      @board.positions[@pos] = self
    else
      raise "not a valid move"
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