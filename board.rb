require './piece'

class Board
  
  attr_accessor :grid, :positions
  
  def initialize
    @grid = Array.new(8) { Array.new(8) { nil } }
    @positions = initial_positions.reduce({}) do |hash, piece|
      hash[piece.pos] = piece
      hash
    end
  end
  
  def initial_positions
    pieces = []
    @grid.each_with_index do |row, i|
      if i == 0 || i == 2
        row.each_index { |j| pieces << Piece.new(:black, self, [i, j]) if j.odd? }
      elsif i == 1
        row.each_index { |j| pieces << Piece.new(:black, self, [i, j]) if j.even? }
      elsif i == 5 || i == 7
        row.each_index { |j| pieces << Piece.new(:white, self, [i, j]) if j.even? }
      elsif i == 6
        row.each_index { |j| pieces << Piece.new(:white, self, [i, j]) if j.odd? }
      end
    end
    pieces
  end
  
  def update_grid
    @positions.each do |k, v|
      @grid[k[0]][k[1]] = v
    end
  end
  
  def pos(piece)
    @grid[piece.pos[0]][piece.pos[1]]
  end
  
  def render
    update_grid
    @grid.map do |row|
      row.map do |piece|
        piece.nil? ? '.' : piece.render
      end.join("  ")
    end.join("\n")
  end
  
  
  def move
    
  end
  
  
end