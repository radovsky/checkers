require './piece'

class Board
  
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) { nil } }
    place_pieces
  end
  
  
  def place_pieces
    @grid.each_with_index do |row, i|
      if i == 0 || i == 2
        row.each_index { |i| row[i] = Piece.new(:black) if i.odd? }
      elsif i == 1
        row.each_index { |i| row[i] = Piece.new(:black) if i.even? }
      elsif i == 5 || i == 7
        row.each_index { |i| row[i] = Piece.new(:white) if i.even? }
      elsif i == 6
        row.each_index { |i| row[i] = Piece.new(:white) if i.odd? }
      end
    end
  end
  
  
  def render
    @grid.map do |row|
      row.map do |piece|
        piece.nil? ? '.' : piece.render
      end.join(" ")
    end.join("\n")
  end
  
  
  def move
    
  end
  
  
end