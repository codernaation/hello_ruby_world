module Adopt
  module DirectionDecoder
    
    WAYS = ['N','NE','E','SE','S','SW','W','NW']
    CELL_TYPES = {
      1 => ['E','SE','S'],
      2 => ['N','NE','E','SE','S'],
      3 => ['N','NE','E'],
      4 => ['W','NW','N','NE','E'],
      5 => ['W','NW','N'],
      6 => ['S','SW','W','NW','N'],
      7 => ['S','SW','W'],
      8 => ['E','SE','S','SW','W'],
      9 => ['N','NE','E','SE','S','SW','W','NW']
    }

    class Position
      attr_accessor :x_pos, :y_pos
      def initialize x = 0, y = 0
        @x_pos = x
        @y_pos = y
      end

      def to_a
        [@x_pos,@y_pos]
      end
    end
    
    def way2pos way
      case way
      when 'N'
        north
      when 'S'
        south
      when 'E'
        east
      when 'W'
        west
      when 'NE'
        north_east
      when 'SE'
        south_east
      when 'NW'
        north_west
      when 'SW'
        south_west  
      end
    end
    
    private
    def north
      {"x" => @x_pos, "y" => (@y_pos - 1)}
    end

    def south 
      {"x" => @x_pos, "y" => (@y_pos + 1)}
    end

    def east 
      {"x" => (@x_pos + 1), "y" => @y_pos}
    end

    def west
      {"x" => (@x_pos - 1), "y" => @y_pos}
    end

    def north_east
      {"x" => (@x_pos + 1), "y" => (@y_pos - 1)}
    end

    def south_east
      {"x" => (@x_pos + 1), "y" => (@y_pos + 1)}
    end

    def north_west
      {"x" => (@x_pos - 1), "y" => (@y_pos - 1)}
    end

    def south_west
      {"x" => (@x_pos - 1), "y" => (@y_pos + 1)}
    end
  end
end