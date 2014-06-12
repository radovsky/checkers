class Piece
  def initialize(color)
    @color = color
    @king = false
  end
  
  def perform_slide
    
  end
  
  def perform_jump
    
  end
  
  def render
    return "0" if @color == :white && @king == false
    return "O" if @color == :black && @king == false
  end
  
end