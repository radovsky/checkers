class Board
  
  def initialize
    @grid = Array.new(8) { Array.new(8) { nil } }
  end
  
  
  def place_pieces
    
    @grid[0..2].each_with_index do |row, i|
      if i.even?
        row.each_with_index do |sq, j|
          sq = Piece.new(:red) if j.odd?
        end
      elsif i.odd?
        row.each_with_index do |sq, j|
          sq = Piece.new(:red) if j.even?
        end
      end
    end
    
    @grid[5..7].each_with_index do |row, i|
      if i.even?
        row.each_with_index do |sq, j|
          sq = Piece.new(:black) if j.odd?
        end
      elsif i.odd?
        row.each_with_index do |sq, j|
          sq = Piece.new(:black) if j.even?
        end
      end
    end
    
  end
  
    # 
  # def fill_row(is_even, color)
  #   if is_even:
  #     row.each_with_index do ||
  #   end
  # end
  
  
  def render
    
  end
  
  def move
    
  end
  
  
end