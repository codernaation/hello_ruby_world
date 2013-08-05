module Adopt
  module DirectionDecoder
    
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