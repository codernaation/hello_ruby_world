#                       N
#     ---------------------------------------
#     |           |             |           |
#     |           |             |           |
#     |     1     |      8      |     7     |
#     |           |             |           |
#     |           |             |           |
#     ---------------------------------------
#     |           |             |           |
#     |           |             |           |
# W   |     2     |      9      |     6     |  E
#     |           |             |           |
#     |           |             |           |
#     ---------------------------------------
#     |           |             |           |
#     |           |             |           |
#     |     3     |      4      |     5     |
#     |           |             |           |
#     |           |             |           |
#     ---------------------------------------
# 
#                         S
module Automatic
  module Terrains
    module Cells
      module Directions
    
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
          9 => WAYS
        }

        def set_directions type
          @ways_to_move = CELL_TYPES[type]
        end

        def random_direction 
          @ways_to_move.sample
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
          to_pos @x_pos, (@y_pos - 1)
        end

        def south 
          to_pos @x_pos, (@y_pos + 1)
        end

        def east 
          to_pos (@x_pos + 1), @y_pos
        end

        def west
          to_pos (@x_pos - 1), @y_pos
        end

        def north_east
          to_pos (@x_pos + 1), (@y_pos - 1)
        end

        def south_east
          to_pos (@x_pos + 1), (@y_pos + 1)
        end

        def north_west
          to_pos (@x_pos - 1), (@y_pos - 1)
        end

        def south_west
          to_pos (@x_pos - 1), (@y_pos + 1)
        end

        def to_pos x, y
          Terrains::Positions::Position.new( x, y) 
        end 

      end
    end
  end
end
