class Triangle
  # write code here

    attr_accessor :side1, :side2, :side3

    def initialize(side1, side2, side3)
        @side1 = side1
        @side2 = side2
        @side3 = side3
    end

  def kind
    if invalid_triangle?
      raise TriangleError
    elsif @side1 > 0 && @side2 > 0 && @side3 > 0 && @side1 == @side2 && @side2 == @side3 && @side1 + @side2 > @side3 && @side2 + @side3 > @side1 
      return :equilateral 
    elsif @side1 > 0 && @side2 > 0 && @side3 > 0 && @side1 == @side2 || @side2 == @side3 || @side1 == @side3 
      return :isosceles
    elsif @side1 > 0 && @side2 > 0 && @side3 > 0 && @side1 != @side2 && @side2 != @side3 && @side1 != @side3 
      return :scalene
    end
  end

  private

  def invalid_triangle?
    allsides = [side1, side2, side3]
    allsides.any? { |side| side <= 0 } || allsides.sort[0] + allsides.sort[1] <= allsides.sort[2]
  end

    class TriangleError < StandardError
      puts "Invalid triangle"
    end
end
